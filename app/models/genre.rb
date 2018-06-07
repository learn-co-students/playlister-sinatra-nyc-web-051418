class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    slug = self.name
    slug.gsub!(/[^a-zA-Z0-9\-]/,"-").downcase
  end
  
end
