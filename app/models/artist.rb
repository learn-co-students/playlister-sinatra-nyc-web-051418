class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name
    slug.gsub!(/[^a-zA-Z0-9\-]/,"-").downcase
  end
  
end
