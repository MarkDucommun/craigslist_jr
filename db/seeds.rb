require 'faker'

10.times { Category.create(name: Faker::Company.bs) }

Category.all.each do |category|
  rand(30..50).times do
    post = category.posts.build( email: Faker::Internet.free_email,
                                 title: Faker::Company.catch_phrase,
                                 description: Faker::Lorem.sentences(rand(2..7)).join(" "),
                                 price: "$#{rand(2..3000)}.#{rand(10..99)}")
    post.create_url
    post.save
  end
end