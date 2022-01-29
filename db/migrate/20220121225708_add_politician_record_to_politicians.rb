class AddPoliticianRecordToPoliticians < ActiveRecord::Migration[7.0]
  def change
    add_reference :politician_records, :politician
  end
end
