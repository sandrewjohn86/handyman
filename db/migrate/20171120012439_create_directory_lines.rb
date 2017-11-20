class CreateDirectoryLines < ActiveRecord::Migration[5.0]
  def change
    create_table :directory_lines do |t|
      t.references :user, foreign_key: true
      t.references :directory, foreign_key: true

      t.timestamps
    end
  end
end
