class Customer < ApplicationRecord
    has_many  :facilities, dependent: :destroy
    has_many  :operations, dependent: :destroy
    has_many  :contacts, dependent: :destroy

    has_and_belongs_to_many :operations, dependent: :destroy
    attribute :operation_ids, dependent: :destroy
    
    validates :custumerName, presence: { message: "Customer Name required!" }
    validates :taxid, length: { maximum: 16 }
    validates :stateRegistration, length: { maximum: 12 }
    validates :fantasyName, uniqueness: { 
        message: ->(object, data) do
            "Fantasy Name '#{data[:value]}' duplicated!"
        end
    }
end
