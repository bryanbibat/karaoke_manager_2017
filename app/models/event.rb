class Event < ApplicationRecord
  belongs_to :entry, optional: true

  has_many :participants, inverse_of: :event
  has_many :entries, inverse_of: :event

  def status
    if start_at < Time.now
      :setup
    elsif end_at < Time.now
      :finished
    elsif entry.nil? || entry.break_flag
      :break
    else
      :active
    end
  end

  def next_5
    query = Entry.order(:order_no).limit(5)
    if entry.present?
      query = query.where("order_no > ?", entry.order_no)
    end
    query
  end

  def next_5_timestamp
    @next_5_timestamp ||=
      next_5.all.sort { |x, y| y.updated_at <=> x.updated_at }.first.try(:updated_at)
  end

  def summary_hash
    {
      status: status.to_s,
      next_5_timestamp: next_5_timestamp.iso8601,
      current_id: entry_id
    }
  end

  def summary_json
    JSON.generate(summary_hash)
  end
end
