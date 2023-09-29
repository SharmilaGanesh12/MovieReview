class MoviesController < ApplicationController
  def index
    if params[:commit]=='search'&&params[:search].blank? && (params[:from_date].blank? || params[:to_date].blank?)
      flash.now[:warning] = 'Please enter at least one search parameter.'
    end
    @pagy,@movies = pagy(Movie.search_by_name(params[:search])
                              .filter_by_release_date(params[:from_date], params[:to_date])
                              .order_by_highest_rating)
  end
end
