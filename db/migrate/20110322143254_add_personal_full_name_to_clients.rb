class AddPersonalFullNameToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :personal_full_name, :string
  end

  def self.down
    remove_column :clients, :personal_full_name
  end
end
