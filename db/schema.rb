# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_24_004015) do

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artists_songs", force: :cascade do |t|
    t.integer "song_id"
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_artists_songs_on_artist_id"
    t.index ["song_id", "artist_id"], name: "index_artists_songs_on_song_id_and_artist_id", unique: true
    t.index ["song_id"], name: "index_artists_songs_on_song_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_games", force: :cascade do |t|
    t.integer "game_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_games_on_category_id"
    t.index ["game_id", "category_id"], name: "index_categories_games_on_game_id_and_category_id", unique: true
    t.index ["game_id"], name: "index_categories_games_on_game_id"
  end

  create_table "categories_songs", force: :cascade do |t|
    t.integer "song_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_songs_on_category_id"
    t.index ["song_id", "category_id"], name: "index_categories_songs_on_song_id_and_category_id", unique: true
    t.index ["song_id"], name: "index_categories_songs_on_song_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guesses", force: :cascade do |t|
    t.integer "song_id"
    t.integer "game_id"
    t.integer "result"
    t.index ["game_id"], name: "index_guesses_on_game_id"
    t.index ["song_id"], name: "index_guesses_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name", null: false
    t.string "spotify_url"
    t.string "preview_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
