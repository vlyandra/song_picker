FactoryBot.define do
  factory :song do
    sequence(:name) { |n| "Song Number #{n}" }
    sequence(:spotify_url) { |n| "https://open.spotify.com/track/#{n}" }
  end
end
