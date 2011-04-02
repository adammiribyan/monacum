class ChangeClientIdToLoanIdInPayments < ActiveRecord::Migration
  def self.up
    remove_column :payments, :client_id
    add_column :payments, :loan_id, :integer
  end

  def self.down
  end
end
