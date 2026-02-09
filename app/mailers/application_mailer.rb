class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILER_DEFAULT_FROM')
  layout "mailer"
end
