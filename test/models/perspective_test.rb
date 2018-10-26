# == Schema Information
#
# Table name: perspectives
#
#  id         :bigint(8)        not null, primary key
#  slug       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PerspectiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
