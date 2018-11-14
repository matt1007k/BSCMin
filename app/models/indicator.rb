# == Schema Information
#
# Table name: indicators
#
#  id           :bigint(8)        not null, primary key
#  aclarar      :string(255)
#  indicador    :string(255)
#  tipo         :string(255)
#  variable     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  objective_id :bigint(8)
#
# Indexes
#
#  index_indicators_on_objective_id  (objective_id)
#
# Foreign Keys
#
#  fk_rails_...  (objective_id => objectives.id)
#

class Indicator < ApplicationRecord
  validates :aclarar, presence: true
  validates :indicador, presence: true
  validates :variable, presence: true
  validates :tipo, presence: true


  belongs_to :objective

  has_many :datos

  scope :objetivo, -> (objective_id) { where objective_id: objective_id }
end
