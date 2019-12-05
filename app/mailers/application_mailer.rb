class ApplicationMailer < ActionMailer::Base
  default from: CONTACT_EMAIL, 
          reply_to: CONTACT_EMAIL
  layout 'mailer'
end
