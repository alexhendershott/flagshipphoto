class RemoveDeviceToPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :device, :string
  end
end
