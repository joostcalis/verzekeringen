class TestFormTemplate < ActiveRecord::Base
  include Publishable
  include FriendlyId

  friendly_id :name, use: :slugged

  has_and_belongs_to_many :form_questions
  has_many :test_forms

  def create_new_from_template
    test_form = TestForm.new(
      type: self.type,
      name: self.name,
      test_form_template: self
    )
  end
  
end
