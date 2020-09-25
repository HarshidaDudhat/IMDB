class Genre < ApplicationRecord
  validates :name, presence: true

  has_many :genre_movies

  has_many :movies_belong_to_genre, through: :genre_movies, source: :genre
end
