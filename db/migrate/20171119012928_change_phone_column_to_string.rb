class ChangePhoneColumnToString < ActiveRecord::Migration[5.0]
  def change
  	  	change_column :clients, :phone, :string
  end
end
