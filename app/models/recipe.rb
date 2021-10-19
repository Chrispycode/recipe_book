require 'open-uri'

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

  def working_url?
    uri = URI.parse(image_url)
    return false unless uri.is_a?(URI::HTTP) && !uri.host.nil?

    req = Net::HTTP.new(uri.host, uri.port)
    req.use_ssl = true
    res = req.request_head(uri.path)
    res.code == '200'
  rescue URI::InvalidURIError, SocketError
    false
  end

  def presence_of_image
    return errors.add(:image_url, 'muss ausgefüllt werden') unless image_url.present? || uploaded_image.attached?

    attached_image? if uploaded_image.attached?
    return if uploaded_image.attached? && image_url.blank?
    return errors.add(:image_url, 'must have an image extension') unless image_url.match(/\.(gif|jpe?g|png|webp)$/)
    return if working_url?

    errors.add(:image_url, 'URL ist nicht erreichbar')
  end

  def attached_image?
    return errors.add(:image_url, 'muss ausgefüllt werden') unless uploaded_image.attached?
    return if uploaded_image.content_type.in?(%w(image/jpeg image/png image/webp image/gif))

    errors.add(:image_url, 'darf nur diese formate haben jpeg, png, webp, gif')
  end
end
