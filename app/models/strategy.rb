# == Schema Information
#
# Table name: strategies
#
#  id         :bigint(8)        not null, primary key
#  content    :text(65535)
#  foda       :string(255)
#  slug       :string(255)
#  tipo       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Strategy < ApplicationRecord
  validates :content, presence: true, length: {minimum:3}
  validates :foda, presence: true
  validates :tipo, presence: true
  

  has_many :objectives, through: :in_objectives
  has_many :in_objectives

  scope :estrategias, -> (type) { where("tipo = ?", type) }
  # Ex:- scope :active, -> {where(:active => true)}
end
