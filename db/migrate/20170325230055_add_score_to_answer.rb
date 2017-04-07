class AddScoreToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :score, :integer, index: true
  end
end
