class Song < ActiveRecord::Base

  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
      self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
      name = slug.split("-").map do |word|
          word.capitalize
      end.join(" ")
      Song.find_by(name: name)
  end

  def genres
      SongGenre.all.select do |song_genre|
        
          self.id == song_genre.song.id
      end
  end

end
