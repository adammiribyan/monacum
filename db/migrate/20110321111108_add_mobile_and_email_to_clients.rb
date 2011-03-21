class AddMobileAndEmailToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :personal_mobile_phone, :string
    add_column :clients, :personal_email, :string
  end

  def self.down
  end
end
