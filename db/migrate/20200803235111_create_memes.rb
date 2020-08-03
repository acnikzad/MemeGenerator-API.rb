class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :top
      t.string :bottom
      t.string :image

      t.timestamps
    end
  end
end
