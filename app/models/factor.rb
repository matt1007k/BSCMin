# == Schema Information
#
# Table name: factors
#
#  id           :bigint(8)        not null, primary key
#  alta         :integer          default(0)
#  baja         :integer          default(0)
#  media        :integer          default(0)
#  muy_negativo :integer          default(0)
#  muy_positivo :integer          default(0)
#  negativo     :integer          default(0)
#  positivo     :integer          default(0)
#  title        :string(255)
#  valor        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  force_id     :bigint(8)
#
# Indexes
#
#  index_factors_on_force_id  (force_id)
#
# Foreign Keys
#
#  fk_rails_...  (force_id => forces.id)
#

class Factor < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}

  belongs_to :force
end
