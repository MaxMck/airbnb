class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  before_validation(on: :create) do
    self.city = city.split.map(&:capitalize).join(' ') if attribute_present?("city")
    self.country = country.split.map(&:capitalize).join(' ') if attribute_present?("city")
  end

  def self.search(query)
    query_capitalized = query.split.map(&:capitalize).join(' ')
    where("city like ?", "%#{query_capitalized}%")
  end

end
