# == Schema Information
#
# Table name: datos
#
#  id           :bigint(8)        not null, primary key
#  abril        :integer          default(0)
#  agosto       :integer          default(0)
#  anio         :integer
#  diciembre    :integer          default(0)
#  enero        :integer          default(0)
#  febrero      :integer          default(0)
#  julio        :integer          default(0)
#  junio        :integer          default(0)
#  marzo        :integer          default(0)
#  mayo         :integer          default(0)
#  noviembre    :integer          default(0)
#  octubre      :integer          default(0)
#  porcentaje   :integer          default(0)
#  septiembre   :integer          default(0)
#  total        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  indicator_id :bigint(8)
#
# Indexes
#
#  index_datos_on_indicator_id  (indicator_id)
#
# Foreign Keys
#
#  fk_rails_...  (indicator_id => indicators.id)
#

class Dato < ApplicationRecord
  validates :anio, presence: true
  
  belongs_to :indicator
end
