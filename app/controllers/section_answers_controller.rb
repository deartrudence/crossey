class SectionAnswersController < ApplicationController
  before_action :set_section_answer, only: [:show, :edit, :update, :destroy]

  # GET /section_answers
  # GET /section_answers.json
  def index
    @section_answers = SectionAnswer.all
  end

  # GET /section_answers/1
  # GET /section_answers/1.json
  def show
  end

  # GET /section_answers/new
  def new
    @section_answer = SectionAnswer.new
  end

  # GET /section_answers/1/edit
  def edit
  end

  # POST /section_answers
  # POST /section_answers.json
  def create
    @section_answer = SectionAnswer.new(section_answer_params)

    respond_to do |format|
      if @section_answer.save
        format.html { redirect_to @section_answer, notice: 'Section answer was successfully created.' }
        format.json { render :show, status: :created, location: @section_answer }
      else
        format.html { render :new }
        format.json { render json: @section_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /section_answers/1
  # PATCH/PUT /section_answers/1.json
  def update
    comment_type = params[:section_answer][:comment_type]
    comment_value = params[:section_answer][:comment_value]
    @section_answer.update_column(comment_type, comment_value)
    @section_answer.save
    head :ok, content_type: "text/html"
  end

  # DELETE /section_answers/1
  # DELETE /section_answers/1.json
  def destroy
    @section_answer.destroy
    respond_to do |format|
      format.html { redirect_to section_answers_url, notice: 'Section answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section_answer
      @section_answer = SectionAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_answer_params
      params.require(:section_answer).permit(:section_id, :individual_review_id, :employee_comment, :reviewer_comment)
    end
end
