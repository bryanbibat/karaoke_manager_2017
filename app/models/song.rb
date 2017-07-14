class Song < ApplicationRecord
  belongs_to :artist

  has_many :entries, inverse_of: :song
end
