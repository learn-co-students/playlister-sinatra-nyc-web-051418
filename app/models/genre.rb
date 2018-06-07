class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
      self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
      name = slug.split("-").join(" ")
      Genre.find_by(name: name)
  end

  def artists
      SongGenre.all.select do |song_genre|
          self.id == song_genre.genre_id
      end.map do |selected_song_genre|
          selected_song_genre.song.artist
      end
  end

  def songs
      SongGenre.all.select do |song_genre|
          self.id == song_genre.genre_id
      end.map do |selected_song_genre|
          selected_song_genre.song
      end
  end

end
