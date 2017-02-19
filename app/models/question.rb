class Question < ActiveRecord::Base
  include Publishable
  include FriendlyId

  friendly_id :content, use: :slugged

  has_many :answers

  scope :per_insurer, -> (insurer) { includes(answers: :insurer).published.select{ |q| q.answers.map(&:insurer).include?(insurer) } }
end
