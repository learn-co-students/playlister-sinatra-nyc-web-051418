class ArtistsController < ApplicationController

  configure do
    set :views, "app/views/artists"
  end

  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/:name' do
    @artist = Artist.find_by(name: params[:name])
    erb :show
  end
end

  get '/artists/new' do
    erb :new
  end
