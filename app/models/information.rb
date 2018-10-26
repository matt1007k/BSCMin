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

class Information < ApplicationRecord
    validates :name, :mission, :vision, :macroproceso, presence: true, length: {minimum: 5}
end
