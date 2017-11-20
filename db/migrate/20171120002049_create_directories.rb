class CreateDirectories < ActiveRecord::Migration[5.0]
  def change
    create_table :directories do |t|
      t.references :client, foreign_key: true
      t.string :directory_title
      t.string :directory_desc

      t.timestamps
    end
  end
end
