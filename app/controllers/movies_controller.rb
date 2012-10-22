class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end


  def index    
    @all_ratings = Movie.movie_ratings
    @sort_on = params[:sort]

    ratings_hash = params[:ratings]
    @ratings_filter = Array.new

    if !Movie.init_value
      @ratings_filter = Movie.ratings_previous
    end

    if !ratings_hash.nil?         
      @ratings_filter = ratings_hash.keys           
    end

    if !@sort_on.nil?
        @ratings_filter = Movie.ratings_previous
    end

    

    @movies = Movie.findall(@sort_on, @ratings_filter)
    
    @page = Movie.ratings_previous
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
