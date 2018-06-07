class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
      self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
      name = slug.split("-").map do |word|
          word.capitalize
      end.join(" ")
      Artist.find_by(name: name)
  end

end
