class Subcategory < ActiveRecord::Base
  has_paper_trail
  belongs_to :category
end
