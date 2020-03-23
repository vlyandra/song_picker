module Playlists
  SEVENTIES = 1
  EIGHTIES = 2
  NINETIES = 3
  AUGHTS = 4
  TENS = 5
  HITS = 6
  OLDIES = 7
  MIX = 8
  MUSICALS = 9

  CATEGORIES = {
    SEVENTIES => '70s',
    EIGHTIES => '80s',
    NINETIES => '90s',
    AUGHTS => '00s',
    TENS => '10s',
    HITS => 'Hits',
    OLDIES => 'Oldies',
    MIX => 'Mix',
    MUSICALS => 'Musicals'
  }.freeze

  LISTS = {
    SEVENTIES => ['37i9dQZF1DWTJ7xPn4vNaz'],
    EIGHTIES => ['37i9dQZF1DX4UtSsGT1Sbe'],
    NINETIES => ['37i9dQZF1DXbTxeAdrVG2l'],
    AUGHTS => %w[37i9dQZF1DX4o1oenSJRJd
                 37i9dQZF1DX1Mj6nQRkc5p],
    TENS => ['37i9dQZF1DX5Ejj0EkURtP'],
    HITS => ['37i9dQZF1DXbYM3nMM0oPk'],
    OLDIES => ['37i9dQZF1DX56bqlsMxJYR'],
    MIX => %w[37i9dQZF1DX0mi9kezFJ0K
              37i9dQZF1DX2nwuHNKim4S
              7pTEksbg6GWGm5bTpyo6rB
              37i9dQZF1DWVP9nDJmt4EV
              68q3IjJ17gHA7r9NdijiUU
              37i9dQZF1DX7Eiu5yWAskb],
    MUSICALS => %w[37i9dQZF1DX3SzuIjjsy97 37i9dQZF1DX8C9xQcOrE6T]
  }.freeze
end
