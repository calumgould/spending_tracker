require_relative('../db/sql_runner')

class Budget

  attr_reader :id
  attr_accessor :amount

  def initialize(options)
    @id = options['id'].to.i() if options['id']
    @amount = options['amount'].to_i()
  end

  def save()
    sql = "INSERT INTO budgets (
    amount
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@amount]
    budget = SqlRunner.run(sql, values)[0]
    @id = budget['id']
  end

  def update()
    sql = "
    UPDATE budgets SET
    amount = $1
    WHERE id = $2"
    values = [@amount, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM budgets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets
    WHERE id = $1"
    values = [id]
    budget = SqlRunner.run(sql, values)
    result = Budget.new(budget.first())
    return result
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    budget_hashes = SqlRunner.run(sql)
    budgets = budget_hashes.map { |budget| Budget.new(budget) }
    return budgets.amount
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM budgets
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


end
