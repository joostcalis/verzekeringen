class Answer < ActiveRecord::Base
  include Publishable
  include FriendlyId

  friendly_id :content, use: :slugged

  belongs_to :insurer
  belongs_to :question

  validates :content, presence: true
  validates :insurer, presence: true
  validates :question, presence: true
end
