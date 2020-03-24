class CreateSongsArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :songs_artists do |t|
      t.belongs_to :song
      t.belongs_to :artist
    end
  end
end
