class EventsController < ApplicationController

  before_action :load_event

  def show
  end

  def live
    # next 5 songs, next song
    # current song
    respond_to do |format|
      format.html
      format.json { render json: @event.summary_hash }
    end
  end

  def load_remote
  end

  private

  def load_event
    @event = Event.includes(entry: [:participant, { song: :artist }], entries: [ :participant, {song: :artist} ]).find_by_slug! params[:id]
  end
end
