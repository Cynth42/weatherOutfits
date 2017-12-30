class Location < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :city, :state, presence: true
end
