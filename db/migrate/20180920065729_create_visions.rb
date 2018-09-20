class CreateVisions < ActiveRecord::Migration[5.2]
  def change
    create_table :visions do |t|
      t.text :title

      t.timestamps
    end
  end
end
