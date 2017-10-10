class Address < ApplicationRecord


  belongs_to :addressable, polymorphic: true, optional: true

  validates :line_1, presence: true
  validates :city, presence: true, inclusion: { in: CITIES }
  validates :province, presence: true, inclusion: { in: PROVINCES }
  validates :zip, presence: true, format: { with: ZIP_REGEX }

  def zip=(value)
    self[:zip] = value.strip.upcase
  end
end
