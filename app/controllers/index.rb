get '/' do
  @categories = Category.all
  erb :index
end

get '/create' do
  @categories = Category.all
  erb :create
end

get '/category/:id' do
  @category = Category.find(params[:id])
  erb :category
end

get '/post/:url/edit' do
  @post = Post.find_by_url(params[:url])
  erb :create
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end


## ******** POST ROUTES ************** ###

post '/create' do
  category = Category.find_or_create_by_name(params[:post][:category])
  puts 'putting category' 
  puts params[:post][:title]
  @post = category.posts.build(title: params[:post][:title],
                               email: params[:post][:email],
                               description: params[:post][:description],
                               price: params[:post][:price])
  @post.create_url

  @post.save
  
  redirect "/post/#{@post.url}/edit"
end

post '/post/:url/edit' do
  @post = Post.find_by_url(params[:url])
  @post.update_attributes(params[:post])
  puts @post.url
  redirect "/post/#{@post.id}"
end
