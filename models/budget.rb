require_relative('../db/sql_runner')

class Budget

  attr_reader :id
  attr_accessor :amount

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @amount = options['amount'].to_i()
  end

  def save()
    sql = "INSERT INTO budget (
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
    UPDATE budget SET
    amount = $1
    WHERE id = $2"
    values = [@amount, @id]
    SqlRunner.run(sql, values)
  end

  def total_budget()
    return @amount
  end

  def self.total_budget()
    sql = "SELECT * FROM budget"
    result = SqlRunner.run(sql)
    budget = Budget.new(result.first())
    return budget.amount.to_i()
  end

  def self.find(id)
    sql = "SELECT * FROM budget
    WHERE id = $1"
    values = [id]
    budget = SqlRunner.run(sql, values)
    result = Budget.new(budget.first())
    return result
  end

  def self.all()
    sql = "SELECT * FROM budget"
    budget_hashes = SqlRunner.run(sql)
    budgets = budget_hashes.map { |budget| Budget.new(budget) }
    return budgets.first()
  end

  def self.delete_all()
    sql = "DELETE FROM budget"
    SqlRunner.run(sql)
  end


end
