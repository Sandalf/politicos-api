class AddStateToPolitician < ActiveRecord::Migration[7.0]
  def change
    add_reference :politicians, :state
  end
end
