require "administrate/base_dashboard"

class EntryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    song: Field::BelongsTo,
    event: Field::BelongsTo,
    participant: Field::BelongsTo,
    id: Field::Number,
    order_no: Field::Number,
    break_flag: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :song,
    :event,
    :participant,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :song,
    :event,
    :participant,
    :id,
    :order_no,
    :break_flag,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :song,
    :event,
    :participant,
    :order_no,
    :break_flag,
  ].freeze

  # Overwrite this method to customize how entries are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(entry)
    "Ev##{entry.event.name} - #{entry.break_or_name}"
  end
end
