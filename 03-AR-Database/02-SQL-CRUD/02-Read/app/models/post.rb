# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
class Post
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @url = attributes[:url] || attributes['url']
    @title = attributes[:title] || attributes['title']
    @votes = attributes[:votes] || attributes['votes']
    DB.results_as_hash = true
  end

  def self.find(id)
    @id = id
    query = <<~SQL
      SELECT * FROM posts WHERE id = ?
    SQL
    result = DB.execute(query, @id)[0]
    return nil if result.nil?

    found = Post.new(result)
  end

  def self.all
    query = 'SELECT * FROM posts'
    all_posts = DB.execute(query)
    all_posts.map { |result| Post.new(result) }
  end
end
