class RenameTypeToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :paintings, :type, :category
  end
end
