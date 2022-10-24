class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display_posts(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1}) ID: #{post.id} | #{post.title} | #{post.url} | VOTES
      : #{post.votes}"
    end
  end

  def add_(something)
    puts "Please write the #{something}?"
    gets.chomp
  end
end
