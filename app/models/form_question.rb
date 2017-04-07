class FormQuestion < ActiveRecord::Base
  include Publishable
  include FriendlyId

  friendly_id :name, use: :slugged

  acts_as_list

  default_scope { order(position: :asc) }

  has_and_belongs_to_many :subject_categories
  has_and_belongs_to_many :test_form_templates
  has_many :form_answers
end
