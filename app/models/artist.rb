class Artist < ActiveRecord::Base
  include Slug
  extend Slug::ClassMethods
  has_many :songs
  has_many :genres, through: :songs
end
