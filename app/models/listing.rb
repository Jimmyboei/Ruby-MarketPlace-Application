class Listing < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :messages, dependent: :destroy
    resourcify
    has_one_attached :picture
    validates :name, presence: true
    validates :price, numericality: { greater_than_orequal_to: 0 }
end
