# == Schema Information
#
# Table name: objectives
#
#  id             :bigint(8)        not null, primary key
#  content        :text(65535)
#  slug           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  perspective_id :bigint(8)
#
# Indexes
#
#  index_objectives_on_perspective_id  (perspective_id)
#
# Foreign Keys
#
#  fk_rails_...  (perspective_id => perspectives.id)
#

class Objective < ApplicationRecord 
  validates :content, presence: true, length: {minimum:10}
  
  belongs_to :perspective

  has_many :indicators, dependent: :destroy

  scope :perspectiva, -> (perspective_id) { where perspective_id: perspective_id }
end
