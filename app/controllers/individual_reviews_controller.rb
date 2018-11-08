class IndividualReviewsController < ApplicationController
  before_action :set_individual_review, only: [:show, :edit, :update, :destroy, :archive]
  before_action :authenticate_has_profile
  load_and_authorize_resource
  # GET /individual_reviews
  # GET /individual_reviews.json
  def index
    @reviews = IndividualReview.all.not_archived
    @users = current_user.reviewed_users.joins(:profile).order('LOWER(profiles.first_name)')
    if current_user.is_super_admin?
      @underlings = User.includes(:profile).all.joins(:profile).order('LOWER(profiles.first_name)').not_archived
    elsif current_user.is_principal? 
      @underlings = current_user.underlings
    end
    @me = current_user
    respond_to do |format|
      format.html
      format.csv { send_data @reviews.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  # GET /individual_reviews/1
  # GET /individual_reviews/1.json
  def show
    @total_check_questions = Question.belongs_to_job_level(@individual_review.employee_job_level).belongs_to_review(@individual_review.review).where(question_type: "check_box").uniq.count
    @check_results = @individual_review.check_results
    @text_results = @individual_review.text_answers
    @results = @individual_review.answers.joins(:question)
  end

  # GET /individual_reviews/new
  def new
    @individual_review = IndividualReview.new
  end

  # GET /individual_reviews/1/edit
  def edit
  end

  # Allow the review to be downloaded 
  def download
    @review = IndividualReview.find(params[:review])
    @employee = @review.employee.profile
    @reviewer = @review.reviewer.profile
    @answers = @review.answers
    @check_results = @review.check_results
    @total_check_questions = Question.belongs_to_job_level(@review.employee_job_level).belongs_to_review(@review.review).where(question_type: "check_box").uniq.count
    @results = @review.answers.joins(:question)
    html = render_to_string('individual_reviews/individual_review.html.erb', layout: 'pdfs/layout_pdf')
    footer = render_to_string('individual_reviews/pdf_footer.html.erb', layout: 'pdfs/layout_pdf')
    pdf = WickedPdf.new.pdf_from_string(html, footer: {content: footer}, margin: {top: 10, bottom: 10})
    send_data(pdf,
      :filename => "individual_review.pdf",
      :type => "application/pdf",
      :diposition => 'attachment')
  end

  

  # POST /individual_reviews
  # POST /individual_reviews.json
  def create
    employee = User.includes(:profile).where(id: individual_review_params[:employee_id]).first
    @individual_review = IndividualReview.new(individual_review_params)
    @individual_review.reviewer_id = current_user.id
    @individual_review.employee_job_level = employee.profile.job_level.to_i
    @individual_review.employee_job_title = employee.profile.job_title

    respond_to do |format|
      if @individual_review.save
        #TODO - add all answers for review based on questions of review type
        questions = Question.belongs_to_job_level(@individual_review.employee_job_level).belongs_to_review(@individual_review.review).uniq
        questions.each do |question|
          Answer.create(question_id: question.id, individual_review_id: @individual_review.id)
        end
        #TODO - add section comments
        @individual_review.sections.each do |section|
          SectionAnswer.create(section_id: section.id, individual_review_id: @individual_review.id)
        end
        #TODO - signatures for Employee, Reviewer, and Principle
        @individual_review.signatures.create(signature_type: "Employee")
        @individual_review.signatures.create(signature_type: "Reviewer")
        @individual_review.signatures.create(signature_type: "Principal")

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
    # raise "update"
    if params[:reviewer_id].present?
      @individual_review.reviewer_id = params[:reviewer_id][:id]
      @individual_review.save
      redirect_to @individual_review, notice: 'Reviewer was successfully updated.'
    else
      @review = IndividualReview.find(params[:individual_review][:review])
      @employee = @review.employee.profile
      @reviewer = @review.reviewer.profile
      @answers = @review.answers
      @check_results = @review.check_results
      @total_check_questions = Question.belongs_to_job_level(@review.employee_job_level).belongs_to_review(@review.review).where(question_type: "check_box").uniq.count
      @results = @review.answers.joins(:question)
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

  def archive
    respond_to do |format|
      if @individual_review.update(archived: true)
        format.html { redirect_to individual_reviews_path, notice: 'Individual review has been removed' }
        format.json { render :show, status: :ok, location: @individual_review }
      else
        format.html { render :edit }
        format.json { render json: @individual_review.errors, status: :unprocessable_entity }
      end
    end 
  end

  def employee_completed
    puts 'EMPLOYEE COMPLETED ACTION ✨✨✨✨✨✨✨✨✨✨✨'
    @review = IndividualReview.find(params[:id])
    @employee = @review.employee.profile
    @reviewer = @review.reviewer.profile
    @answers = @review.answers
    @check_results = @review.check_results
    @total_check_questions = Question.belongs_to_job_level(@review.employee_job_level).belongs_to_review(@review.review).where(question_type: "check_box").uniq.count
    @results = @review.answers.joins(:question)
    html = render_to_string('individual_reviews/individual_review.html.erb', layout: 'pdfs/layout_pdf')
    @pdf = WickedPdf.new.pdf_from_string(html)
    PdfMailer.pdf_email(@pdf, @employee).deliver
    ReviewCompleteMailer.review_complete_email(@employee).deliver

    respond_to do |format|
      if @individual_review.update(employee_completed: true)
        format.html { redirect_to @individual_review, notice: 'Individual review has been completed by the employee' }
        format.json { render :show, status: :ok, location: @individual_review }
      else
        format.html { render :edit }
        format.json { render json: @individual_review.errors, status: :unprocessable_entity }
      end
    end 
  end

  def reviewer_completed
    respond_to do |format|
      if @individual_review.update(reviewer_completed: true)
        format.html { redirect_to @individual_review, notice: 'Individual review has been completed by the reviewer' }
        format.json { render :show, status: :ok, location: @individual_review }
      else
        format.html { render :edit }
        format.json { render json: @individual_review.errors, status: :unprocessable_entity }
      end
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
