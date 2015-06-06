class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_table :pins, :photos
  end
end
