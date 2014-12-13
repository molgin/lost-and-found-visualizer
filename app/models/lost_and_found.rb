class LostAndFound < ActiveRecord::Base
  has_paper_trail
  has_many :categories
  has_many :subcategories, through: :categories
end
