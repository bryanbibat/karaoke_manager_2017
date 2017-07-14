class Entry < ApplicationRecord
  belongs_to :song, optional: true
  belongs_to :event
  belongs_to :participant, optional: true

  def break_or_name
    if break_flag
      "BREAK"
    else
      "#{participant.code}-#{song.code}-#{song.machine}"
    end
  end

  def long_display
    "#{song.title} - #{song.artist.name}"
  end
end
