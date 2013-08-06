class Category < ActiveRecord::Base
  has_many :posts

  def self.exists?(category)
    Category.create(name: category) unless Category.where(name: category)
    return Category.where(name: category)
  end
end
