class Message < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  resourcify
end