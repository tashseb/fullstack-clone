class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
    DB.results_as_hash = true
  end

  def save
    if @id.nil?
      add_post
    else
      update_post
    end
  end

  def add_post
    query = "INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)"
    DB.execute(query, @url, @votes, @title)
    puts "Record saved!"
    @id = DB.last_insert_row_id
  end

  def update_post
    query = "UPDATE posts SET url = ?, votes = ?, title = ? WHERE id = ? "
    updated_post = DB.execute(query, @url, @votes, @title, @id)
  end
end
