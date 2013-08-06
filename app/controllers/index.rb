get '/' do
  @categories = Category.all
  erb :index
end

get '/create' do

  erb :create
end

get '/create/:key/edit' do

  erb :create
end

get '/category/:id' do

  erb :category
end

get '/post/:id' do

  erb :post
end


## ******** POST ROUTES ************** ###

post '/create' do
  category = Category.find_or_create_by_name(params[:post][:category])
  @post = category.build_post(params[:post])

  # @post.key = KeyGen.create_key
  @post.create_url

  @post.save
  
  redirect "/post/#{@key}/edit"
end

post 'post/edit' do

  redirect "/post/#{@key}/edit"
end
