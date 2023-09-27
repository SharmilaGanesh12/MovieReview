# frozen_string_literal: true

class ReviewsController < ApplicationController
  # Action to be done before executing the actions
  before_action :set_movie

  def index
    @pagy,@reviews = pagy(@movie.reviews.includes([:user]).all)
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.create(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      format.js
      if @review.save
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_reviews_path(@movie), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # private methods
  private

  # method to find movie id
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
