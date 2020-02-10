require_relative('../db/sql_runner')

class Track

  attr_reader :id, :category_id, :merchant_id, :time_stamp
  attr_accessor :amount

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @amount = options['amount'].to_i()
    @category_id = options['category_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @time_stamp = Time.now
  end

# .strftime("%k:%M - %d/%m/%Y")

  def save()
    sql = "INSERT INTO tracks (
    amount,
    category_id,
    merchant_id,
    time_stamp
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@amount, @category_id, @merchant_id, @time_stamp]
    track = SqlRunner.run(sql, values)[0]
    @id = track['id']
  end

  def update()
    sql = "
    UPDATE tracks SET (
      amount,
      category_id,
      merchant_id,
      time_stamp
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@amount, @category_id, @merchant_id, @time_stamp, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tracks
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def category()
    sql = "SELECT * FROM categories
    WHERE id = $1"
    values = [@category_id]
    results = SqlRunner.run(sql, values)[0]
    return Category.new(results)
  end

  def category_name()
    sql = "SELECT categories.name FROM categories WHERE id = $1"
    values = [@category_id]
    category_name = SqlRunner.run(sql, values)[0]
    return category_name['name']
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run(sql, values)[0]
    return Merchant.new(results)
  end

  def merchant_name()
    sql = "SELECT merchants.name FROM merchants WHERE id = $1"
    values = [@merchant_id]
    merchant_name = SqlRunner.run(sql, values)[0]
    return merchant_name["name"]
  end

  def self.total_spent()
    sql = "SELECT amount FROM tracks"
    spends_hashes = SqlRunner.run(sql)
    spends = spends_hashes.reduce(0){|sum, spend| sum + spend['amount'].to_i()}
  end

  def self.find(id)
    sql = "SELECT * FROM tracks
    WHERE id = $1"
    values = [id]
    track = SqlRunner.run(sql, values)
    result = Track.new(track.first())
    return result
  end

  def self.all()
    sql = "SELECT * FROM tracks"
    tracks = SqlRunner.run(sql)
    return tracks.map { |track| Track.new(track) }
  end

  def self.delete_all()
    sql = "DELETE FROM tracks"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM tracks
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
