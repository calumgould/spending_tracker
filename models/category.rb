require_relative('../db/sql_runner')

class Category

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO categories (
    name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    category = SqlRunner.run(sql, values)[0]
    @id = category['id']
  end

  def tracks_by_category()
    sql = "SELECT * FROM tracks
    WHERE category_id = $1"
    values = [@id]
    tracks = SqlRunner.run(sql, values)
    return tracks.map { |track| Track.new(track) }
  end

  def self.find(id)
    sql = "SELECT * FROM categories
    WHERE id = $1"
    values = [id]
    category = SqlRunner.run(sql, values)
    result = Category.new(category)[0]
    return result
  end

  def self.all()
    sql = "SELECT * FROM categories"
    categories = SqlRunner.run(sql)
    return categories.map { |category| Category.new(category) }
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM categories
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end