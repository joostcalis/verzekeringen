class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :insurer, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.text :content
      t.boolean :published

      t.timestamps null: false
    end
    add_index :answers, :content
  end
end
