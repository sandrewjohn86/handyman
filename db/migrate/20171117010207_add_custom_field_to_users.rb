class AddCustomFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :integer
    add_column :users, :secondary_skill, :string
    add_column :users, :rate, :integer
    add_column :users, :intro_summary, :text
  end
end
