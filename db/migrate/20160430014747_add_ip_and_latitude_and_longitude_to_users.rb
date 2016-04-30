class AddIpAndLatitudeAndLongitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ip, :string
    add_column :users, :latitude, :string
    add_column :users, :longitude, :string
  end
end
