class AddForeignKeyToPolitician < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :politicians, :states
  end
end
