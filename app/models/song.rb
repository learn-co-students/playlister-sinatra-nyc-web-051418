class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(/[^a-zA-Z0-9\-]/,"-").downcase
  end

  def self.find_by_name(song_slug)
    Song.all.find do |song|
      song.slug == song_slug
    end
  end

end
