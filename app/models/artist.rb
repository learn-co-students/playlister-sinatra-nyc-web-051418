class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/[^a-zA-Z0-9\-]/,"-").downcase
  end

  def self.find_by_slug(artist_slug)
    Artist.all.find do |artist|
      artist.slug == artist_slug
    end
  end

  def self.find_or_create_by(name)
    if self.find_by(name: name)
      self.find_by(name: name)
    else
      Artist.create(name: name)
    end
  end

end
