class MoviesController < ApplicationController  
  before_filter :restrict_access, :except => [:index]

  def index

    if params[:search] || params[:time]
      search = params[:search]
      @time = params[:time]
      @movies = Movie.search(params[:search])
      #Same as above -> @movies = Movie.where("title like '%#{search}%' or director like '%#{search}%' ")
      runtime_search
    else
      @movies = Movie.all
    end
    
  end

  def show
    @movie = Movie.find(params[:id])  
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def runtime_search
    case @time 
    when "all"
    @movies 
    when "<90"
    @movies = @movies = @movies.where("runtime_in_minutes BETWEEN 0 AND 90") 
    when "90-120"
    @movies = @movies = @movies = @movies.where("runtime_in_minutes BETWEEN 90 AND 120") 
    when ">120"
    @movies = @movies = @movies = @movies.where("runtime_in_minutes BETWEEN 120 AND 1000")   
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image)
  end
end
