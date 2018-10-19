class Objective < ApplicationRecord 
  validates :content, presence: true, length: {minimum:10}
  
  belongs_to :perspective

end
