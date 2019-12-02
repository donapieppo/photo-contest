class ApplicationMailer < ActionMailer::Base
  default from: 'dipmat-supportoweb@unibo.it', 
          reply_to: 'dipmat-supportoweb@unibo.it'
  layout 'mailer'
end
