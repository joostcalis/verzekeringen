class CreateTestFormTemplate < ActiveRecord::Migration
  def change
    create_table :test_form_templates do |t|
      t.integer :type, add_index: true
      t.string :name, add_index: true, unique: true
      t.boolean :published
      t.string :slug, add_index: true, unique: true
    end
  end
end
