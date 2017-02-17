class Question < ActiveRecord::Base
  include Publishable
  include FriendlyId

  friendly_id :content, use: :slugged

  has_many :answers
end
