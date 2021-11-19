class SupportRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_request_mailer.response.subject
  #
  def response(support_request)
    @support_request = support_request

    mail to: @support_request.email, subject: "Re: #{@support_request.subject}"
  end
end
