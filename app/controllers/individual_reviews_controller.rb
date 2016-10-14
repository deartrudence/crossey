class IndividualReviewsController < ApplicationController
  before_action :set_individual_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_has_profile
  load_and_authorize_resource
  # GET /individual_reviews
  # GET /individual_reviews.json
  def index
    # @individual_reviews = IndividualReview.all
    if current_user.is_super_admin?
      @users = User.includes(:profile).all
    elsif current_user.is_principal?
      user_array = current_user.authored_reviews.map(&:employee_id)
      @users = User.includes(:profile).where(id: user_array)
      user_array = Profile.by_job_type(current_user.profile.job_type).less_than_level(current_user.profile.job_level).map(&:user_id)
      @underlings = User.includes(:profile).where(id: user_array)
    elsif current_user.is_reviewer?
      user_array = current_user.authored_reviews.map(&:employee_id)
      @users = User.includes(:profile).where(id: user_array) 
    end
    @me = current_user
      
    # @individual_reviews_as_employee = IndividualReview.find_roles(:employee, current_user)
    # @individual_reviews_as_reviewer = IndividualReview.find_roles(:reviewer, current_user)
  end

  # GET /individual_reviews/1
  # GET /individual_reviews/1.json
  def show
    @total_check_questions = @individual_review.questions.where(question_type: "check_box").count
    @check_results = @individual_review.check_results
    @text_results = @individual_review.text_results
    @results = @individual_review.answers.joins(:question)
    @color_array = ['primary', 'navy', 'purple', 'warning', 'teal', 'maroon', 'success',  'info' ]
  end

  # GET /individual_reviews/new
  def new
    @individual_review = IndividualReview.new
  end

  # GET /individual_reviews/1/edit
  def edit
    @color_array = ['primary', 'navy', 'purple', 'teal', 'maroon' ]
  end
  # Allow the review to be downlaoded 
  def download
    @review = IndividualReview.find(params[:review])
    @employee = @review.employee.profile
    @reviewer = @review.reviewer.profile
    @answers = @review.answers
    @check_results = @review.check_results
    @total_check_questions = @review.questions.where(question_type: "check_box").count
    @results = @review.answers.joins(:question)
    @color_array = ['primary', 'navy', 'purple', 'warning', 'teal', 'maroon', 'success',  'info']
    html = render_to_string('individual_reviews/individual_review.html.erb', layout: 'pdfs/layout_pdf')
    pdf = WickedPdf.new.pdf_from_string(html)
    send_data(pdf,
      :filename => "individual_review.pdf",
      :type => "application/pdf",
      :diposition => 'attachment')
  end

  # POST /individual_reviews
  # POST /individual_reviews.json
  def create
    employee = Profile.where(id: individual_review_params[:employee_id]).first
    @individual_review = IndividualReview.new(individual_review_params)
    @individual_review.reviewer_id = current_user.id
    @individual_review.employee_job_type = employee.job_type
    @individual_review.employee_job_title = employee.job_title
    respond_to do |format|
      if @individual_review.save
        #TODO - add all answers for review based on questions of review type
        @individual_review.questions.each do |question|
          Answer.create(question_id: question.id, individual_review_id: @individual_review.id)
        end
        #TODO - add section comments
        @individual_review.sections.each do |section|
          SectionAnswer.create(section_id: section.id, individual_review_id: @individual_review.id)
        end
        #TODO - signatures for Employee, Reviewer, and Principle
        @individual_review.signatures.create(signature_type: "Employee")
        @individual_review.signatures.create(signature_type: "Reviewer")
        @individual_review.signatures.create(signature_type: "Principle")

        format.html { redirect_to @individual_review, notice: 'Individual review was successfully created.' }
        format.json { render :show, status: :created, location: @individual_review }
      else
        format.html { render :new }
        format.json { render json: @individual_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individual_reviews/1
  # PATCH/PUT /individual_reviews/1.json
  def update
    @review = IndividualReview.find(params[:individual_review][:review])
    @employee = @review.employee.profile
    @reviewer = @review.reviewer.profile
    @answers = @review.answers
    @check_results = @review.check_results
    @total_check_questions = @review.questions.where(question_type: "check_box").count
    @results = @review.answers.joins(:question)
    @color_array = ['primary', 'navy', 'purple', 'warning', 'teal', 'maroon', 'success',  'info']
    html = render_to_string('individual_reviews/individual_review.html.erb', layout: 'pdfs/layout_pdf')
    @pdf = WickedPdf.new.pdf_from_string(html)
    PdfMailer.pdf_email(@pdf, @employee).deliver
    respond_to do |format|
      if @individual_review.update(individual_review_params)
        format.html { redirect_to @individual_review, notice: 'Individual review was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual_review }
      else
        format.html { render :edit }
        format.json { render json: @individual_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_reviews/1
  # DELETE /individual_reviews/1.json
  def destroy
    @individual_review.destroy
    respond_to do |format|
      format.html { redirect_to individual_reviews_url, notice: 'Individual review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_review
      @individual_review = IndividualReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_review_params
      params.require(:individual_review).permit(:user_id, :review_id, :reviewer_id, :employee_id, :date, signatures_attributes:[:id, :_destroy, :individual_review_id, :name, :date, :signed, :signature_type], answers_attributes:[:id, :_destroy, :individual_review_id, :question_id, :answer])
    end
end
