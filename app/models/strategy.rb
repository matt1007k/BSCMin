class Strategy < ApplicationRecord
  validates :content, presence: true, length: {minimum:3}
  validates :foda, presence: true
  

  belongs_to :objective

  scope :strategies, -> (tipo) { where("type = ?", tipo) }
  # Ex:- scope :active, -> {where(:active => true)}
end
