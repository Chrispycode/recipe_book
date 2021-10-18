class Recipe < ApplicationRecord
  has_one_attached :uploaded_image
  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :reviews, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :title, :description, :author
  validate :presence_of_image

  def image
    return if new_record?
    return image_url if image_url.present?
    Rails.application.routes.url_helpers.rails_blob_path(uploaded_image, only_path: true)
  end

  protected

  def presence_of_image
    return if uploaded_image.attached?
    return if image_url.present?
    errors.add(:image_url, "muss ausgefüllt werden")
  end
end
