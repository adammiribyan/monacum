class ChangeAmountToFloatInLoans < ActiveRecord::Migration
  def self.up
    change_column :loans, :amount, :float
  end

  def self.down
  end
end
