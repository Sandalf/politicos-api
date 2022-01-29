class Politician < ApplicationRecord
    belongs_to :state
    has_many :politician_record, dependent: :destroy
end
