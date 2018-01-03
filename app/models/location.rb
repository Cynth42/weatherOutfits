class Location < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :city, :state, presence: true
end
