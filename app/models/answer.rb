class Answer < ActiveRecord::Base
  include Publishable
  belongs_to :insurer
  belongs_to :question

  validates :content, presence: true
  validates :insurer, presence: true
  validates :question, presence: true
end
