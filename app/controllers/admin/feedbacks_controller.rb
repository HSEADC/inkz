class Admin::FeedbacksController < Admin::ApplicationController
  before_action :set_master, only: [:new, :create]
  before_action :set_feedback, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]


  def index
    @feedbacks = Feedback.all
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to master_url(@feedback.master), notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
