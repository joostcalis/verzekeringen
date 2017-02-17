class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :slug, add_index: true, unique: true
      t.text :content
      t.boolean :published

      t.timestamps null: false
    end
    add_index :questions, :content
  end
end
