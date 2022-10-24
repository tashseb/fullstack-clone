require_relative "../views/posts_view"
require_relative "../models/post"

class PostsController < ActiveRecord::Relation
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    posts = Post.all
    posts.to_a.map(&:serializable_hash)
    # TODO: give them to the view to be printed
    @view.display_posts(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.add_("title of your post.")
    url = @view.add_("url of your post.")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    index
    post_id = @view.add_("ID of the post you want to EDIT").to_i
    post = Post.find(post_id)
    post.update(title: @view.add_("NEW title of your post"))
    post.update(url: @view.add_("NEW url of your post"))
    p post
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    post_id = @view.add_("ID of the post you want to DELETE.").to_i
    post = Post.find(post_id)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    post_id = @view.add_("ID of the post you want to VOTE.").to_i
    post = Post.find(post_id)
    post.update(votes: post.votes + 1)
  end
end
