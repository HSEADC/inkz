class Admin::FeedbacksController < Admin::ApplicationController
  before_action :set_master, only: [:new, :create]
  before_action :set_feedback, only: %i[show edit update destroy]


  def index
    @feedbacks = Feedback.all
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to admin_feedback_path, notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id])
    @master = @feedback.master
  end

  def set_master
    @master = Master.find(params[:master_id])
  end
end
