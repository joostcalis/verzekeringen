class Insurer < ActiveRecord::Base
  include Publishable
  include FriendlyId
  has_many :answers

  friendly_id :name, use: :slugged
  validates :name, presence: true, uniqueness: true
  validates :affiliate_link, presence: true, uniqueness: true
  validates :meta_page_title, presence: true, uniqueness: true

end
