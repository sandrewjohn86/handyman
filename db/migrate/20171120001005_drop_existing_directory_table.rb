class DropExistingDirectoryTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :directories
  end
end
