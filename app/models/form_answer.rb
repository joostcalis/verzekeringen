class FormAnswer < ActiveRecord::Base
  belongs_to :form_question
  belongs_to :test_form

  scope :belonging_to_test_form, -> (test_ids) { where(test_form_id: test_ids) }
end
