class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :review, index: true, foreign_key: true
      t.string :title
      t.string :portion
      t.text :employee_comment
      t.text :reviewer_comment

      t.timestamps null: false
    end
  end
end
