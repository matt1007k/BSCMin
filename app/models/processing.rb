class Processing < ApplicationRecord
    validates :title, presence: :true, length: { minimum:3 }
    
    has_many :sub_processes
end
