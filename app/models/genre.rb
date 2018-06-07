class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.gsub(/[^a-zA-Z0-9\-]/,"-").downcase
  end

  def self.find_by_name(genre_slug)
    Genre.all.find do |genre|
      genre.slug == genre_slug
    end
  end

end
