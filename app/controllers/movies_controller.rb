class MoviesController < ApplicationController
  def index
    @pagy,@movies = pagy(Movie.search_by_name(params[:search])
                              .filter_by_release_date(params[:from_date], params[:to_date])
                              .order_by_highest_rating)
    end
end
