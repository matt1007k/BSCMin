# == Schema Information
#
# Table name: fichas
#
#  id           :bigint(8)        not null, primary key
#  amarillo     :string(255)
#  meta         :integer
#  rojo         :string(255)
#  tiempo       :string(255)
#  unidad       :string(255)
#  verde        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  indicator_id :bigint(8)
#
# Indexes
#
#  index_fichas_on_indicator_id  (indicator_id)
#
# Foreign Keys
#
#  fk_rails_...  (indicator_id => indicators.id)
#

require 'test_helper'

class FichaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
