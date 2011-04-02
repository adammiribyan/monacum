class AddClientIdToPayments < ActiveRecord::Migration
  def self.up
    add_column :payments, :client_id, :integer
  end

  def self.down
    remove_column :payments, :client_id
  end
end
