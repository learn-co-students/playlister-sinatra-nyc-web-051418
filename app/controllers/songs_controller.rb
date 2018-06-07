class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
      # binding.pry
    @genres = @song.genres


    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name], artist_id: params[:song][:artist_id])
    @song.genres << Genre.find_by(id: params[:song][:genre_id])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    erb :'/songs/edit'
  end

  put '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(name: params[:song][:artist][:name])

    @new_genres = params[:song][:genres].map do |genre|
      Genre.find_by(name: genre)
    end
    @song.update(name: params[:song][:name], artist_id: @artist.id, genres:@new_genres)
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
