# == Schema Information
#
# Table name: areas
#
#  id         :bigint(8)        not null, primary key
#  name       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ApplicationRecord
    validates :name, presence: true, length: {minimum:3}

    has_many :activities
end
