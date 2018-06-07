class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug = self.name
    slug.gsub!(/[^a-zA-Z0-9\-]/,"-").downcase
  end
  
end
