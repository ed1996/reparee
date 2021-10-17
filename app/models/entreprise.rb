class Entreprise < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :delete_all
  has_many :reservations, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  validates :artisan_type, presence: true
  validates :company_name, presence: true
  validates :address, presence: true
  validates :legal_form, presence: true
  validates :siren, presence: true, length: {maximum: 9}
  validates :phone, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

end
