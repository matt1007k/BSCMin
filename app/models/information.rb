class Information < ApplicationRecord
    validates :name, :mission, :vision, :macroproceso, presence: true, length: {minimum: 5}
end
