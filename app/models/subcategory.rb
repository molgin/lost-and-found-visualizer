class Subcategory < ActiveRecord::Base
  has_paper_trail
  belongs_to :category

  def changes_in_last_day
    # this should be in some kinda module
    versions.where('created_at >= :one_day_ago',
    :one_day_ago  => Time.now - 1.day)
  end

  def changes_in_last_n_days(num)
    # this should be in some kinda module
    versions.where('created_at >= :n_days_ago',
    :n_days_ago  => Time.now - num.days)
  end

end
