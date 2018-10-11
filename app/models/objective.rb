class Objective < ApplicationRecord
  belongs_to :perspective

  has_many :strategies
end
