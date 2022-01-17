# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.date :released_at

      t.timestamps
    end
    add_reference :albums, :artist, foreign_key: true
  end
end
