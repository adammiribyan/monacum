class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :amount
      t.integer :term
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
