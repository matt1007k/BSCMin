# == Schema Information
#
# Table name: activities
#
#  id             :bigint(8)        not null, primary key
#  alta           :integer          default(0)
#  baja           :integer          default(0)
#  bueno          :integer          default(0)
#  deficiente     :integer          default(0)
#  media          :integer          default(0)
#  muy_bueno      :integer          default(0)
#  muy_deficiente :integer          default(0)
#  name           :text(65535)
#  valor          :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  area_id        :bigint(8)
#
# Indexes
#
#  index_activities_on_area_id  (area_id)
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id)
#

class Activity < ApplicationRecord
  validates :name, presence: true

  belongs_to :area
end
