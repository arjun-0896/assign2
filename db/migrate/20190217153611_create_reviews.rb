class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :subject
      t.text :body
      t.string :customer:id
      t.string :tour_id
      t.timestamps
    end
  end
end
