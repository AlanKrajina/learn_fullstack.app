class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.integer :lesson_id

      t.timestamps
    end
  end
end
