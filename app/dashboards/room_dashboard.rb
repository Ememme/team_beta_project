require "administrate/base_dashboard"

class RoomDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tenancy_contracts: Field::HasMany,
    students: Field::HasMany,
    id: Field::Number,
    capacity: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    number: Field::Number,
    name: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :tenancy_contracts,
    :students,
    :capacity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :number,
    :students,
    :capacity,
    :name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :number,
    :capacity,
    :name,
    :students,
  ].freeze

  def display_resource(room)
    "#{I18n.t('activerecord.models.room.one')} ##{room.number} (ID: #{room.id})"
  end
end
