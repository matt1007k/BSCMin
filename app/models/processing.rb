# == Schema Information
#
# Table name: processings
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Processing < ApplicationRecord
    validates :title, presence: :true, length: { minimum:3 }
    
    has_many :sub_processes
end
