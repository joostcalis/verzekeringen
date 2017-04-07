class CreateFormAnswer < ActiveRecord::Migration
  def change
    create_table :form_answers do |t|
      t.integer :score, add_index: true, unique: true
      t.references :form_question, index: true, foreign_key: true
    end
  end
end
