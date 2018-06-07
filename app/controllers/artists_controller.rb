class ArtistsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/show'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/show'
  end

  get '/songs/:slug' do
    erb :songs
  end

  get '/genres/:slug' do
    erb :genres
  end

  get '/artists/:slug' do
    erb :artists
  end

end
