class Transfer
  attr_accessor :bank_account, :status
  attr_reader :sender, :receiver, :amount
  def initialize (sender, receiver, amount)
    @status = “pending”
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end
  def execute_transaction
    if valid? && sender.balance > amount && self.status == “pending”
      sender.balance -= amount
      receiver.balance += amount
      self.status = “complete”
    else
      self.status = “rejected”
      return “Transaction rejected. Please check your account balance.”
    end
  end
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == “complete”
      sender.balance += amount
      receiver.balance -= amount
      self.status= “reversed”
    end
  end
end