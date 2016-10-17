class CreateQuestionJobLevels < ActiveRecord::Migration
  def change
    create_table :question_job_levels do |t|
      t.integer :job_level
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
