class SupportRequestsController < ApplicationController
  def index
    @support_requests = SupportRequest.all
  end

  def update
    support_request = SupportRequest.find(params[:id])
    if support_request.update(response: params.require(:support_request)[:response])
      SupportRequestMailer.response(support_request).deliver_later
      redirect_to support_requests_path, notice: 'Response support request is success'
    else
      redirect_to support_requests_path, alert: 'Response support request is fail'
    end
  end
end
