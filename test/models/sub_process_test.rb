# == Schema Information
#
# Table name: sub_processes
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  processing_id :bigint(8)
#
# Indexes
#
#  index_sub_processes_on_processing_id  (processing_id)
#
# Foreign Keys
#
#  fk_rails_...  (processing_id => processings.id)
#

require 'test_helper'

class SubProcessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
