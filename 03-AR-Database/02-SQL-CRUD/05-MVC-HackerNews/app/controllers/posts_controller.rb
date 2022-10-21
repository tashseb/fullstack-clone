require_relative '../models/post'
require_relative '../views/posts_view'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    all_posts = Post.all
    @view.display_posts(all_posts)
  end

  def create
    # TODO: implement creating a new post
    title = @view.add_("title")
    url = @view.add_("URL")
    @post = Post.new(title: title, url: url)
    @post.save
    # @view.display_posts(@post)
  end

  def update
    # TODO: implement updating an existing post
    index
    index = @view.add_("post you want to update. Input the index").to_i - 1
    post = Post.all[index]
    post.title = @view.add_("the new title")
    post.url = @view.add_("the new url")
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    index
    index_to_delete = @view.add_("post you want to delete?").to_i - 1
    post = Post.all[index_to_delete]
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    vote = @view.add_("post you want to vote to?").to_i - 1
    post = Post.all[vote]
    post.votes += 1
    post.save
  end
end
