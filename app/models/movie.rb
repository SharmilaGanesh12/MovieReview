class Movie < ApplicationRecord

  #association
  has_many :reviews,dependent: :destroy

  # validation
  validates :name, :release_date,presence: true
  validates :name, uniqueness: { case_sensitive: false,message: 'should be unique' }

  def update_average_rating
    self.average_rating = reviews.average(:rating).to_f.round(1)
    save
  end

  def recalculate_average_rating
    update_average_rating
  end

  scope :order_by_highest_rating, -> { order(average_rating: :desc) }
  scope :search_by_name, ->(keyword) { where('lower(name) LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
  scope :filter_by_release_date, lambda { |from_date, to_date|
    where(release_date: from_date..to_date) if from_date.present? && to_date.present?
  }
end
