class RemoveClientIdFromPayments < ActiveRecord::Migration
  def self.up
    remove_column :payments, :client_id
  end

  def self.down
  end
end
