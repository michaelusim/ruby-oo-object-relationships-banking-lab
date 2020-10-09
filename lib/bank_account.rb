class BankAccount
  attr_reader name
  attr_accessor :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

  def deposit(amount)
    @balance = @balance + amount
  end

  def display_balance
    "Your balance is $#{@balance}."
    end
  def self.valid?
    if (@status == "open") &&  (@balance > 0)
      return true
    else
      return false
    end
  end

  def close_account
    @status = "closed"
  end

  end
end

# puts help.valid?
