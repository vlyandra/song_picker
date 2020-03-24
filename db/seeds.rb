# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

require "yaml"

data = YAML.load_file("db/seed_data/songs.yml")

data[:songs].each do |k,v|
  category = Category.create(name: k)

  v.each do |track|
    song = Song.create(
      name: track[:name],
      spotify_url: track[:spotify_url],
      preview_url: track[:preview_url],
    )

    track[:artists].map do |artist|
      artist = Artist.find_or_create_by(name: artist)
      artist.songs << song
      artist.save!
    end

    category.songs << song
    category.save!
  end
end
