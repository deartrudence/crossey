class AddFieldsToSignature < ActiveRecord::Migration
  def change
    add_reference :signatures, :individual_review, index: true, foreign_key: true
    add_column :signatures, :signature_type, :string
  end
end
