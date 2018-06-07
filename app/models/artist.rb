class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres#, through: :songs

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
      Genre.all.select do |genre|
          binding.pry
          genre.artist == self
      end
  end

end
