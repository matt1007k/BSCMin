class Strategy < ApplicationRecord
  validates :content, presence: true, length: {minimum:3}
  validates :foda, presence: true
  

  belongs_to :objective

  scope :estrategias, -> (type) { where("tipo = ?", type) }
  # Ex:- scope :active, -> {where(:active => true)}
end
