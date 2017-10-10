class Property < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :bedrooms, :bathrooms, presence: true,
                                   numericality: {
                                     only_integer: true,
                                     greater_than_or_equal_to: 0
                                   }

  def name
    "#{address.line_1}, #{address.city}, #{address.zip}"
  end
end
