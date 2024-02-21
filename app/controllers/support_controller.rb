class SupportController < ApplicationController
  def request_support
    @support = Support.new(support_params)

    respond_to do |format|
      if @support.save
        format.html { redirect_to welcome_index_url(@support), notice: "Support request was successfully sent." }

        SupportMailer.with(support: @support).user_support_request_email.deliver_now
        SupportMailer.with(support: @support).admin_support_request_email.deliver_now

      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def support_params
      params.require(:support).permit(:email, :comment)
    end
end
