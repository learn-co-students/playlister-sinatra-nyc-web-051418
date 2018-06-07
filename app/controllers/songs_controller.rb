class SongsController < ApplicationController

  configure do
    set :views, "app/views/songs"
  end

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  get '/songs/:name' do
    @song = Song.find_by(name: params[:name])
    @song_artist = @song.artist.name
    @song_genre = @song.genres
    erb :show
  end

  get '/songs/:name/edit' do
    @song = Song.find_by(name: params[:name])
    erb :edit
end



end
