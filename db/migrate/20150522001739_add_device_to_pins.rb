class AddDeviceToPins < ActiveRecord::Migration
  def change
    add_column :pins, :device, :string
  end
end
