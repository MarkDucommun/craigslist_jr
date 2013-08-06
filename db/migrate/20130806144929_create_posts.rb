class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :email
      t.string :title
      t.text :description
      t.string :price
      t.string :url
      t.belongs_to :category, unique: true, index: true
      t.timestamps
    end
  end
end
