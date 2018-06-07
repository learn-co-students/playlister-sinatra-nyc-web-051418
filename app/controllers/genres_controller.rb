class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artists = @genre.artists
    @songs = @genre.songs
    # binding.pry
    erb :"genres/show"
  end

  get '/genres/:id' do
    @genre = Genre.find_by(id: params[:id])

    erb :"genres/show"
  end

  # get 'genres/:slug' do
  #   @genre = Genre.find_by(name: params[:name])
  #
  #   erb :show
  # end


end


# /genres
# This should present the user with a list of all genres in the library.
# Each genre should be a clickable link to that particular genre's show page.

# /genres/:slug
# Any given genre's show page should have links to each of its genres and songs.
