# Add seed data here. Seed your database with `rake db:seed`
Artist.create(name: "Drake")
test_song = Song.create(name: "Hot Line Bling", artist_id: 1)
test_genre = Genre.create(name: "Rap")
SongGenre.create(song_id: test_song.id, genre_id: test_genre.id)
