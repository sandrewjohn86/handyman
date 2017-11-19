class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.text :quote_details
      t.bigint :total
      t.string :timeframe
      t.string :start_date

      t.timestamps
    end
  end
end
