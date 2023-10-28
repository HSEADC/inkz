class SubscriptionsController < ApplicationController

  # GET /subscriptions/1 or /subscriptions/1.json
  def show
  end

  # POST /subscriptions or /subscriptions.json
  def create
    puts('ebal yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:email)
    end
end
