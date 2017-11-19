class AddCustomFieldToClientTable < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :fname, :string
    add_column :clients, :lname, :string
    add_column :clients, :address, :string
    add_column :clients, :phone, :integer
  end
end
