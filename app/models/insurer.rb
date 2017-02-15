class Insurer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :affiliate_link, presence: true, uniqueness: true
  validates :meta_page_title, presence: true, uniqueness: true
end
