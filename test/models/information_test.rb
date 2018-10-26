# == Schema Information
#
# Table name: information
#
#  id           :bigint(8)        not null, primary key
#  macroproceso :string(255)
#  mission      :text(65535)
#  name         :string(255)
#  vision       :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class InformationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
