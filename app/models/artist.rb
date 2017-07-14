class Artist < ApplicationRecord
  has_many :songs, inverse_of: :artist
end
