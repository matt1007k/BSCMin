class AddAreaRefToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :area, foreign_key: true
  end
end
