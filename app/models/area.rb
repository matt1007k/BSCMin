class Area < ApplicationRecord
    validates :name, presence: true, length: {minimum:3}

    has_many :activities
end
