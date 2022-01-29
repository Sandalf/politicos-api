class ChangeTypeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :politicians, :type, :category
    rename_column :politician_records, :type, :category
  end
end
