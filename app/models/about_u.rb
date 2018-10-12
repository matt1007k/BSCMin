class AboutU < ApplicationRecord
    validates :name, presence: :true, length: { minimum:3 }
    validates :mission, presence: :true, length: { minimum:3 }
    validates :vision, presence: :true, length: { minimum:3 }
    validates :macroproceso, presence: :true, length: { minimum:3 }
end