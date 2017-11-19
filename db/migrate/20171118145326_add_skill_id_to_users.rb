class AddSkillIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skill_id, :integer
  end
end
