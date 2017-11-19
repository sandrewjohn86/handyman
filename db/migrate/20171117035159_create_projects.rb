class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :project_title
      t.text :project_desc
      t.string :address
      t.integer :budget

      t.timestamps
    end
  end
end
