class ApplicationMailer < ActionMailer::Base
  def initialize
    @send_in_blue = SibApiV3Sdk::SMTPApi.new
  end


  default from: 'liz@givitytesttest.com'
  layout 'mailer'
end
