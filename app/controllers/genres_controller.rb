class GenresController < ApplicationController

  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index 
      @genres = Genre.all 
  end

  def new
      @genre = Genre.new
  end

  def create
      @genre = Genre.create(genre_params)
      redirect_to @genre
  end

  def show
      @genre = Genre.find(params[:id])
      @movies_belong_to_genre = @genre.movies_belong_to_genre
  end
  
  def edit
      @genre = Genre.find(params[:id])
      redirect_to @genre
  end

  def update
      @genre = Genre.find(params[:id])
      redirect_to @genre
  end

  def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy

      redirect_to genres_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name, :movie_ids)
  end	


end
