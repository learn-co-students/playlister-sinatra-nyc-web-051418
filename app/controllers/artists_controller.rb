class ArtistsController < ApplicationController

  # get '/songs' do
  #   @songs = Song.all
  #   erb :'songs/index'
  # end
  #
  # get '/genres' do
  #   @genres = Genre.all
  #   erb :'genres/index'
  # end

  get '/artists' do
    @artists = Artist.all
    erb:'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  # get '/songs/new' do
  #   erb :'songs/new'
  # end
  #
  # post '/songs' do
  #   @artist = Artist.find_or_create_by(params[:artist_name])
  #   @song = Song.create(name: params[:song_name], artist_id: @artist.id)
  #   params[:genres].each do |genre|
  #     SongGenre.create(genre_id: genre.to_i, song_id: @song.id)
  #   end
  #   redirect "songs/#{@song.slug}"
  # end
  #
  # get '/songs/:slug' do
  #   @song = Song.find_by_slug(params['slug'])
  #   erb :'songs/show'
  # end
  #
  # get '/songs/:slug/edit' do
  #   @song = Song.find_by_slug(params['slug'])
  #   erb :'songs/edit'
  # end
  #
  # patch '/songs' do
  #   @artist = Artist.find_or_create_by(params[:artist_name])
  #   @song = Song.find_by(name: params[:song_name])
  #    @genres = params[:genres].map do |genre|
  #     Genre.find_by(id: genre)
  #   end
  #   # binding.pry
  #   @song.update(name: params[:song_name], artist_id: @artist.id, genres: @genres)
  #   redirect "songs/#{@song.slug}"
  # end
  #
  # get '/genres/:slug' do
  #   @genre = Genre.find_by_slug(params['slug'])
  #
  #   erb :'genres/show'
  # end
  #






end
