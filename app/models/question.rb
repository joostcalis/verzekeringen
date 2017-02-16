class Question < ActiveRecord::Base
  include Publishable
  has_many :answers
end
