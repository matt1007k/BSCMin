# == Schema Information
#
# Table name: perspectives
#
#  id         :bigint(8)        not null, primary key
#  slug       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Perspective < ApplicationRecord
    validates :title, presence: true, length: {minimum: 3}
    
    has_many :objectives
end
