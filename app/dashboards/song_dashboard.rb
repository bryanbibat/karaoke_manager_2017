require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artist: Field::BelongsTo,
    events: Field::HasMany,
    entries: Field::HasMany,
    id: Field::Number,
    code: Field::String,
    title: Field::String,
    machine: Field::String,
    lyrics: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :artist,
    :entries,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artist,
    :entries,
    :id,
    :code,
    :title,
    :machine,
    :lyrics,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artist,
    :entries,
    :code,
    :title,
    :machine,
    :lyrics,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(song)
    song.title
  end
end
