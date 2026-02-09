module ApplicationHelper
  def default_datetime_format
    "%A, %b %-d %Y %-l:%M %p"
  end
  
  def format_datetime(datetime, format = nil)
    f = format || default_datetime_format
    datetime.strftime(f) unless datetime.blank?
  end
end
