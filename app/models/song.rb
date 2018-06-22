class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  # def slug
  #     #self.name.downcase.split(" ").join("-")
  #     self.name.gsub(/[^a-zA-Z0-9\-]/,"-").downcase
  # end

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
      # name = slug.split("-").map do |word|
      #     word.capitalize
      # end.join(" ")
      # Song.find_by(name: name)

      Song.all.find do |song|
        song.slug == slug
      end
  end

  # def genres
  #     SongGenre.all.select do |song_genre|
  #
  #         self.id == song_genre.song.id
  #     end
  # end

end
