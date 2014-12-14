require 'open-uri'

class LostAndFound < ActiveRecord::Base
  has_paper_trail
  has_many :categories
  has_many :subcategories, through: :categories




  def update_from_api
    doc = Nokogiri::XML(open("http://advisory.mtanyct.info/LPUWebServices/CurrentLostProperty.aspx"))
    self.lost_articles = doc.xpath('//NumberOfLostArticles').text.to_i
    self.items_claimed = doc.xpath('//NumberOfItemsclaimed').text.to_i
    self.save
    cats = doc.xpath('//Category')
    cats.each do |cat|
      cat_object = Category.find_or_create_by(name: cat.attr('Category').strip)
      cat_object.lost_and_found = self
      subcats = cat.children
      subcats.each do |subcat|
        subcat_object = Subcategory.find_or_create_by(name: subcat.attr('SubCategory').strip)
        subcat_object.total_items = subcat.attr('count').to_i
        subcat_object.category = cat_object
        subcat_object.save
      end
      cat_object.total_items = cat_object.subcategories.pluck(:total_items).inject(:+)
      cat_object.save
    end
  end

end
