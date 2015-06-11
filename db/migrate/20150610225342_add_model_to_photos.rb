class AddModelToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :model, :string
  end
end
