class Entry < ApplicationRecord
  belongs_to :song, optional: true
  belongs_to :event
  belongs_to :participant, optional: true

  def break_or_name
    if break_flag
      "break"
    else
      "#{participant.code}-#{song.code}-#{song.machine}"
    end
  end
end
