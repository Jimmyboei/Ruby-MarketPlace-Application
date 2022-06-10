class Listing < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :messages, dependent: :destroy
    resourcify
end
