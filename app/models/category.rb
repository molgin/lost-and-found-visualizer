class Category < ActiveRecord::Base
  has_paper_trail
  has_many :subcategories
  belongs_to :lost_and_found
end
