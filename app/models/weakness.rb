# == Schema Information
#
# Table name: weaknesses
#
#  id          :bigint(8)        not null, primary key
#  content     :text(65535)
#  slug        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint(8)
#
# Indexes
#
#  index_weaknesses_on_activity_id  (activity_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#

class Weakness < ApplicationRecord
end
