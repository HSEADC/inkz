class FeedbacksController < ApplicationController
  before_action :set_master, only: [:new, :create]
  before_action :set_feedback, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks or /feedbacks.json
  def create
    @feedback = @master.feedbacks.new(feedback_params)
    @feedback.user = current_user if user_signed_in?

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to master_url(@master), notice: "Feedback was successfully created." }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1 or /feedbacks/1.json
 def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to master_url(@feedback.master), notice: "Feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1 or /feedbacks/1.json
  def destroy
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to master_url(@feedback.master), notice: "Feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
      @master = @feedback.master
    end

    # Only allow a list of trusted parameters through.
    def feedback_params
      params.require(:feedback).permit(:comment, :rating, :user_id, :master_id)
    end

    def set_master
      @master = Master.find(params[:master_id])
    end

    def authorize_user
      if current_user
        if @feedback.user_id == current_user.id
          # Allow regular users to manage and delete their own feedbacks
          true
        elsif current_user.is_master? && @feedback.master.user_id == current_user.id
          # Allow masters to manage and delete feedbacks associated with their master
          true
        else
          # Redirect or show an error if the user doesn't have the required permissions
          redirect_to root_path, alert: 'You are not authorized to perform this action.'
          false
        end
      else
        # If the user is not logged in, redirect to the login page
        redirect_to new_user_session_path, alert: 'You must be logged in to perform this action.'
        false
      end
    end
end
