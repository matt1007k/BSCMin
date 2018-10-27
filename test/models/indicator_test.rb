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

require 'test_helper'

class IndicatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
