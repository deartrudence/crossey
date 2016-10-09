class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :subsection
      t.string :job_type
      t.string :question_text
      t.string :question_type
      t.references :section, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
