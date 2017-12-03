class ChangeAttributeTypeToDate < ActiveRecord::Migration[5.0]
  def up
  	change_column :quotes, :start_date, :string
  end

   def down
  	change_column :quotes, :start_date, :date
  end
end
