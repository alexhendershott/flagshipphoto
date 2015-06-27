class ChangeDefaultForVcount < ActiveRecord::Migration
  def change
    change_column :photos, :vcount, :integer, :default => 0
  end
end
