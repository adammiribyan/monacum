class AddPhotoToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :photo, :string
  end

  def self.down
    remove_column :clients, :photo
  end
end
