class IndividualReviewsController < ApplicationController
  before_action :set_individual_review, only: [:show, :edit, :update, :destroy]

  # GET /individual_reviews
  # GET /individual_reviews.json
  def index
    @individual_reviews = IndividualReview.all
    @individual_reviews_as_employee = IndividualReview.find_roles(:employee, current_user)
    @individual_reviews_as_reviewer = IndividualReview.find_roles(:reviewer, current_user)
  end

  # GET /individual_reviews/1
  # GET /individual_reviews/1.json
  def show
  end

  # GET /individual_reviews/new
  def new
    @individual_review = IndividualReview.new
  end

  # GET /individual_reviews/1/edit
  def edit
  end

  # POST /individual_reviews
  # POST /individual_reviews.json
  def create
    @individual_review = IndividualReview.new(individual_review_params)
    @review = Review.last
    respond_to do |format|
      if @individual_review.save
        #TODO - add all answers for review based on questions of review type
        # ir.questions.each do |question|
        #   Answer.create(question_id: question.id, individual_review_id: ir.id)
        # end
        #TODO - signatures for Employee, Reviewer, and Principle
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
      params.require(:individual_review).permit(:user_id, signatures_attributes:[:id, :_destroy, :individual_review_id, :name, :date, :signed, :signature_type], answers_attributes:[:id, :_destroy, :individual_review_id, :question_id, :answer])
    end
end
