class PostsView
  # TODO: implement methods called by the PostsController
  def display_posts(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1}.) Title: #{post.title} URL: #{post.url}, Votes: #{post.votes}"
    end
  end

  def add_(something)
    puts "What is the #{something}?"
    print ">"
    gets.chomp
  end
end
