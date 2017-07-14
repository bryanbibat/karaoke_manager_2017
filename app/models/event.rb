class Event < ApplicationRecord
  belongs_to :entry, optional: true

  has_many :participants, inverse_of: :event
  has_many :entries, inverse_of: :event
end
