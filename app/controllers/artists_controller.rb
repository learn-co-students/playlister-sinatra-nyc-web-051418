class ArtistsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_name(params['slug'])
    erb :'songs/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_name(params['slug'])

    erb :'genres/show'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_name(params['slug'])

    erb :'artists/show'
  end

end
