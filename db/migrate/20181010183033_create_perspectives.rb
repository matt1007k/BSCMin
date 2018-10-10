class CreatePerspectives < ActiveRecord::Migration[5.2]
  def change
    create_table :perspectives do |t|
      t.string :slug
      t.string :title

      t.timestamps
    end
  end
end
