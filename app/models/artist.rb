class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/[^a-zA-Z0-9\-]/,"-").downcase
  end

  def self.find_by_name(artist_slug)
    Artist.all.select do |artist|
      artist.slug == artist_slug
    end
  end

end
