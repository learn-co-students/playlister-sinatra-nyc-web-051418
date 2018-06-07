class GenresController < ApplicationController

  configure do
    set :views, "app/views/genres"
  end

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

  get '/genres/:name' do
    @genre = Genre.find_by(name: params[:name])
    erb :show
  end
end
