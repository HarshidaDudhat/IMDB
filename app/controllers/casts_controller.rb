class CastsController < ApplicationController
    before_action :set_cast, only:[:show, :edit, :update, :destroy]
	

	def index
		@casts = Cast.all	
	end

	def new
		@cast = Cast.new
		@movies = Movie.all
	end

	def create
		@cast = Cast.new(cast_params)
        if @cast.save
            @cast.update_movies(params[:movie_ids])
            redirect_to @cast
        else
            render 'new'
        end
  end

	def show
		@cast = Cast.find(params[:id])
		@movies_acted = @cast.movies_acted
		@movies_directed = @cast.movies_directed
	end

	def edit
		@cast = Cast.find(params[:id])
		@movies = Movie.all
	end
	
	def update
		@cast = Cast.find(params[:id])
  	redirect_to @cast
	end

  def destroy
    @cast.destroy
      respond_to do |format|
      format.html { redirect_to casts_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private

    def set_cast
    	@cast = Cast.find(params[:id])
    end

    def cast_params
    	params.require(:cast).permit(:name, :date_of_birth, :no_of_movies, :rank, :movie_ids)
	end	
end
