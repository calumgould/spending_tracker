require_relative('../db/sql_runner')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (
    name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    merchant = SqlRunner.run(sql, values)[0]
    @id = merchant['id']
  end

  def update()
    sql = "
    UPDATE merchants SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def tracks_by_merchant()
    sql = "SELECT * FROM tracks
    WHERE merchant_id = $1"
    values = [@id]
    tracks = SqlRunner.run(sql, values)
    return tracks.map { |track| Track.new(track) }
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql, values)
    result = Merchant.new(merchant.first())
    return result
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchant_hashes = SqlRunner.run(sql)
    merchants = merchant_hashes.map { |merchant| Merchant.new(merchant) }
    return merchants.sort_by {|merchant| merchant.name }
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
