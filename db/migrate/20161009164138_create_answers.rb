class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :individual_review, index: true, foreign_key: true
      t.text :answer

      t.timestamps null: false
    end
  end
end
