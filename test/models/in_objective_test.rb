# == Schema Information
#
# Table name: in_objectives
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  objective_id :bigint(8)
#  strategy_id  :bigint(8)
#
# Indexes
#
#  index_in_objectives_on_objective_id  (objective_id)
#  index_in_objectives_on_strategy_id   (strategy_id)
#
# Foreign Keys
#
#  fk_rails_...  (objective_id => objectives.id)
#  fk_rails_...  (strategy_id => strategies.id)
#

require 'test_helper'

class InObjectiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
