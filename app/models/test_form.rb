class TestForm < ActiveRecord::Base
  has_many :form_answers
  belongs_to :test_form_template
end
