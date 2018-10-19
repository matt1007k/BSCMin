class Perspective < ApplicationRecord
    validates :title, presence: true, length: {minimum: 3}
    
    has_many :objectives
end
