class CreateSectionAnswers < ActiveRecord::Migration
  def change
    create_table :section_answers do |t|
      t.references :section, index: true, foreign_key: true
      t.references :individual_review, index: true, foreign_key: true
      t.text :employee_comment
      t.text :reviewer_comment

      t.timestamps null: false
    end
  end
end
