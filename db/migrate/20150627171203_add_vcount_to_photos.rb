class AddVcountToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :vcount, :integer
  end
end
