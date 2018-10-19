class Strategy < ApplicationRecord
  validates :content, presence: true, length: {minimum:3}
  validates :foda, presence: true
  

  has_many :objectives, through: :in_objectives
  has_many :in_objectives

  scope :estrategias, -> (type) { where("tipo = ?", type) }
  # Ex:- scope :active, -> {where(:active => true)}
end
