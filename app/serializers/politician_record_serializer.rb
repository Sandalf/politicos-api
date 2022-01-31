class PoliticianRecordSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :description, :category
end
