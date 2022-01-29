class CreatePoliticianRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :politician_records do |t|
      t.date :start_date
      t.date :end_date
      t.string :description
      t.integer :type

      t.timestamps
    end
  end
end
