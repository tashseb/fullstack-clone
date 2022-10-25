require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  # TODO
  # 1. fetch posts from database.
  @posts = Post.descending_order
  # @post.descending_order
  # 2. Store these posts in an instance variable
  # 3. Use it in the `app/views/posts.erb` view

  erb :posts # Do not remove this line
end

get '/vote/:id' do
  id = params[:id]
  @post = Post.find(id)
  @post.votes += 1
  @post.save!

  erb :show
end

get '/posts/:id' do
  id = params[:id]
  @post = Post.find(id)

  erb :show
end

# TODO: add more routes to your app!
post '/posts' do
  title = params[:title]
  url = params[:url]


  post = Post.new(title: title, url: url, user_id: 1)
  post.save!

  redirect "/posts/#{post.id}"
end
