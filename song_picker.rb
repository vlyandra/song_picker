CLIENT_ID = ENV['SPOTIFY_CLIENT_ID']
CLIENT_SECRET = ENV['SPOTIFY_CLIENT_SECRET']

class SongPicker
  require 'net/http'
  require 'json'
  require 'yaml'
  require_relative 'playlists'

  def initialize(categories = [])
    @categories = categories
  end

  def authorize
    uri = URI('https://accounts.spotify.com/api/token')
    req = Net::HTTP::Post.new(uri)
    req.basic_auth CLIENT_ID, CLIENT_SECRET
    req.set_form_data('grant_type' => 'client_credentials')

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    JSON.parse(res.body)['access_token']
  end

  def pick
    data = YAML.load_file('songs.yml')[:songs]
    if @categories.any?
      tracks = []
      @categories.each do |category|
        tracks += (data[Playlists::CATEGORIES[category]])
      end
      tracks.sample
    else
      data.values.flatten(1).sample
    end
  end
end

puts SongPicker.new.pick
