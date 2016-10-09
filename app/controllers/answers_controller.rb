class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    # answers created upon IndividualReview creation
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    question = params[:answer][:question_id]
    individual_review = params[:answer][:individual_review_id]
    answer_value = params[:answer][:answer_value]
    answer_id = params[:answer][:answer_id]
    @answer = Answer.find(answer_id)
    @answer.update(answer: answer_value)
    @answer.save
    head :ok, content_type: "text/html"
    # respond_to do |format|
    #   if @answer.update(answer_params)
    #     format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @answer }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @answer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:question_id, :individual_review_id, :answer)
    end
end
