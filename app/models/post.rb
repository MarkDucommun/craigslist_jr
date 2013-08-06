class Post < ActiveRecord::Base
  belongs_to :category, dependent: :destroy

  def create_key
    self.key = KeyGen.create_key
  end
end
