# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :duration
      t.string :genre
      t.string :featured_image_text
      t.integer :track_number

      t.timestamps
    end
    add_reference :songs, :album, foreign_key: true
  end
end
