# == Schema Information
#
# Table name: opportunities
#
#  id         :bigint(8)        not null, primary key
#  content    :text(65535)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  factor_id  :bigint(8)
#
# Indexes
#
#  index_opportunities_on_factor_id  (factor_id)
#
# Foreign Keys
#
#  fk_rails_...  (factor_id => factors.id)
#

class Opportunity < ApplicationRecord
end
