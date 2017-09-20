class IndividualReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :sections, through: :review
  has_many :questions, through: :review
  has_many :signatures, dependent: :destroy
  has_many :answers
  has_many :section_answers
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :reviewer, :class_name => "User", :foreign_key => "reviewer_id"

  accepts_nested_attributes_for :answers, allow_destroy: :true

  accepts_nested_attributes_for :signatures, allow_destroy: :true

  REVIEW_COLORS = [ 'navy', 'green', 'teal', 'purple', 'orange', 'maroon','navy', 'green', 'teal', 'purple', 'orange', 'maroon' ]

  scope :not_archived, -> { where(archived: false) }

  scope :completed, -> { where(employee_completed: true, reviewer_completed: true)}

  scope :incompleted, -> { where('employee_completed= ? OR reviewer_completed= ?', false, 'bar')}

  def check_results
    hash = {
      'Exceeds Expectations' => 0, 
      'Meets Expectations' => 0,
      'Needs Improvement' => 0,
      'N/A' => 0
    }
    Answer::ANSWERS.each do |answer|
      # count = self.answers.where(answer: answer).count
      count = self.check_box_answers.where(answer: answer).count
      hash[answer] = count
    end
    return hash
  end

  def check_box_answers
    self.answers.includes(:question).where(questions: {question_type: 'check_box'})
  end

  def text_answers
    self.answers.includes(:question).joins(:question).where(questions: {question_type: 'text'})
  end

  def is_current_reviewer(user)
    self.reviewer_id == user.id
  end

  def total_percentage_result
    (self.check_results["Exceeds Expectations"].to_f + self.check_results["Meets Expectations"].to_f)/ self.check_box_answers.count.to_f
  end

  def has_passed?
    total_percentage_result > 0.50
  end

  def totally_completed?
    self.employee_completed && self.reviewer_completed
  end

  def job_level_to_title
    
  end
  
end
