class AddTestFormToFormAnswer < ActiveRecord::Migration
  def change
    add_reference :form_answers, :test_form, index: true, foreign_key: true
  end
end
