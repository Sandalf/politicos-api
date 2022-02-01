class AddUnaccentExtension < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE EXTENSION IF NOT EXISTS UNACCENT"
  end

  def down
    execute "DROP EXTENSION UNACCENT"
  end
end
