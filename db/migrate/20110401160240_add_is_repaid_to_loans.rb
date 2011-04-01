class AddIsRepaidToLoans < ActiveRecord::Migration
  def self.up
    add_column :loans, :is_repaid, :boolean, :default => false
  end

  def self.down
    remove_column :loans, :is_repaid
  end
end
