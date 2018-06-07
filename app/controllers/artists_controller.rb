class ArtistsController < ApplicationController

    get '/artists' do
      @artists = Artist.all

      erb :"artists/index"
    end

    get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      @songs = @artist.songs
      @genres = @artist.genres
      binding.pry

      erb :"artists/show"
    end

    # get 'artists/new' do
    #
    #     erb :new
    # end

    get '/artists/:id' do
      @artist = Artist.find_by(id: params[:id])

      erb :"artists/show"
    end

    # get 'artists/:slug' do
    #   @artist = Artist.find_by(name: params[:name])
    #
    #   erb :show
    # end




end


# /artists
# This should present the user with a list of all artists in the library.
# Each artist should be a clickable link to that particular artist's show page.

# /artists/:slug
# Any given artist's show page should have links to each of his or her songs and genres.
