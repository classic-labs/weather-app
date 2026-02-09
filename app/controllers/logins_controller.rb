class LoginsController < ApplicationController
  before_action :authenticate_user!
  around_action :catch_not_found
  
  private
  
  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to errors_404_path
  end
end
