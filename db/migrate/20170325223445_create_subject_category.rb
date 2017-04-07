class CreateSubjectCategory < ActiveRecord::Migration
  def change
    create_table :subject_categories do |t|
      t.string :name, add_index: true, unique: true
    end
  end
end
