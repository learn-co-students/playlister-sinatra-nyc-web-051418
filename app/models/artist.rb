class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
      self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
      name = slug.split("-").map do |word|
          word.capitalize
      end.join(" ")
      Artist.find_by(name: name)
  end

  def songs
      Song.all.select do |song|
          song.artist == self
      end
  end

  def genres
      SongGenre.all.select do |song_genre|
          song_genre.song.artist_id == self.id
      end.map do |selected_song_genre|
          selected_song_genre.genre
      end
  end

end
