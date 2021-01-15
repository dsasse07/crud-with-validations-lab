class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true 
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :genre, presence: true
  
  with_options if: :released do |song|
    song.validates :release_year, presence: true, numericality: {less_than_or_equal_to: DateTime.now.year}
  end


end
