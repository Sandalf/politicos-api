class AddForeignKeyToPoliticianRecord < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :politician_records, :politicians
  end
end
