class SubProcess < ApplicationRecord
  validates :title, presence: :true, length: { minimum:3 }
  
  belongs_to :processing
end
