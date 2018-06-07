class Genre < ActiveRecord::Base
  include Slug
  extend Slug::ClassMethods
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres
end
