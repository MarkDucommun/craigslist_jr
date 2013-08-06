class Post < ActiveRecord::Base
  belongs_to :category, dependent: :destroy

  def create_url
    self.url = UrlGen.create_url
  end
end
