require 'net/http'
require 'json'
require 'yaml'
require '../song_picker/playlists'

CLIENT_ID = ENV["SPOTIFY_ID"]
CLIENT_SECRET = ENV["SPOTIFY_SECRET"]

uri = URI('https://accounts.spotify.com/api/token')
req = Net::HTTP::Post.new(uri)
req.basic_auth CLIENT_ID, CLIENT_SECRET
req.set_form_data('grant_type' => 'client_credentials')

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(req)
end

token = JSON.parse(res.body)['access_token']
track_url = 'https://api.spotify.com/v1/playlists/PLAYLIST_ID/tracks'
field_params = { fields: 'items(track(name,artists,album(name),external_urls,preview_url))'}

File.open('songs.yml', 'w') do |f|
  data = { songs: {} }
  Playlists::LISTS.each do |category, lists|
    songs = []
    lists.each do |id|
      url = track_url.dup
      uri = URI(url.sub('PLAYLIST_ID', id))
      uri.query = URI.encode_www_form(field_params)
      req = Net::HTTP::Get.new(uri)
      req['Authorization'] = "Bearer #{token}"

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      tracks = JSON.parse(res.body)["items"]

      tracks.each do |data|
        track = data["track"]
        artists = track["artists"].collect {|a| a["name"] }
        songs << {

          name: track["name"],
          album: track["album"]["name"],
          spotify_url: track["external_urls"]["spotify"],
          preview_url: track["preview_url"],
          artists: artists
        }
      end
    end

    data[:songs][Playlists::CATEGORIES[category]] = songs
  end
  f.puts data.to_yaml
end
