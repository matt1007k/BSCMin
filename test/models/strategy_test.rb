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

require 'test_helper'

class StrategyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
