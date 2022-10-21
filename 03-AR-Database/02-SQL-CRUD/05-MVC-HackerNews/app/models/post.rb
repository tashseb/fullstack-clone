class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @title = attributes[:title]
    @votes = attributes[:votes] || 0
  end

  def self.find(id)
    query = <<~SQL
      SELECT * FROM posts WHERE id = ?
    SQL
    DB.results_as_hash = true
    result = DB.execute(query, id)[0]
    return nil if result.nil?

    # result.transfor_keys!(&:to_sym)
    found = Post.new(result.transform_keys(&:to_sym))
  end

  def self.all
    query = 'SELECT * FROM posts'
    DB.results_as_hash = true
    all_posts = DB.execute(query)
    all_posts.map { |result| Post.new(result.transform_keys!(&:to_sym)) }
  end

  def save
    @id.nil? ? add_post : update_post
  end

  def destroy
    query = "DELETE FROM posts WHERE id = ?"
    DB.execute(query, @id)
  end

  private

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
