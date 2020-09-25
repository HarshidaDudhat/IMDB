class MoviesController < ApplicationController

    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index 
        @movies = Movie.all 
    end

    def new
        @movie = Movie.new
        @casts = Cast.all
        @genres = Genre.all
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            @movie.update_actors(params[:actor_ids])
            redirect_to @movie
        else
            render 'new'
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end
    
    def edit
        @movie = Movie.find(params[:id])
        @casts = Cast.all
        @genres = Genre.all
    end

    def update
        @movie = Movie.find(params[:id])
        
        if @movie.update(movie_params)
            @movie.update_actors(params[:actor_ids])
            @movie.update_genres(params[:genre_ids])
            redirect_to @movie
        else
            render 'edit'
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy

        redirect_to movies_path
    end

    private

    def set_movie
    	@movie = Movie.find(params[:id])
    end

    def movie_params
    	params.require(:movie).permit(:name, :ratings, :release_date, :rank, :actor_ids, :genre_ids)
    end	

    
end
