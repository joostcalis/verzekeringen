class CreateFormQuestion < ActiveRecord::Migration
  def change
    create_table :form_questions do |t|
      t.string :name, add_index: true, unique: true
      t.text :content, add_index: true, unique: true
      t.integer :type
      t.string :slug, add_index: true, unique: true
      t.boolean :published
    end
  end
end
