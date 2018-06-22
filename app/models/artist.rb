class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

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
      # Artist.find_by(name: name)
      Artist.all.find do |artist|
        artist.slug == slug
      end
  end
  #
  # def songs
  #     Song.all.select do |song|
  #         song.artist == self
  #     end
  # end
  #
  # def genres
  #     SongGenre.all.select do |song_genre|
  #         song_genre.song.artist_id == self.id
  #     end.map do |selected_song_genre|
  #         selected_song_genre.genre
  #     end
  # end
  #
  # def self.find_or_create_by(name)
  #   if self.find_by(name: name)
  #     self.find_by(name: name)
  #   else
  #     Artist.create(name: name)
  #   end
  # end

end
