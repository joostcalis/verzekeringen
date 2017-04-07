class CreateTestForm < ActiveRecord::Migration
  def change
    create_table :test_forms do |t|
      t.integer :type
      t.string :name
      t.references :test_form_template, index: true, foreign_key: true
    end
  end
end
