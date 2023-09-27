class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  # validation
  validates :rating,presence: true
  validates :comment,presence: true

  after_commit :update_movie_average_rating

  private

  def update_movie_average_rating
    movie.recalculate_average_rating
  end
end
