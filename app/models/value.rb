# == Schema Information
#
# Table name: values
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Value < ApplicationRecord
    validates :title, presence: true, length: {minimum:3}
end
