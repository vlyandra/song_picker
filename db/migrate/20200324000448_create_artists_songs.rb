class CreateArtistsSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :artists_songs do |t|
      t.belongs_to :song
      t.belongs_to :artist
    end

    add_index :artists_songs, [:song_id, :artist_id], unique: true
  end
end
