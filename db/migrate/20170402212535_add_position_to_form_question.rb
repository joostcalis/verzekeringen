class AddPositionToFormQuestion < ActiveRecord::Migration
  def change
    add_column :form_questions, :position, :integer
  end
end
