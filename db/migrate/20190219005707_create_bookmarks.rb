class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|

      t.string :customer_id
      t.string :tour_id

      t.timestamps
    end
  end
end
