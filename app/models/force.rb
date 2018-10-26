# == Schema Information
#
# Table name: forces
#
#  id         :bigint(8)        not null, primary key
#  name       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Force < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}

  has_many :factors
end
