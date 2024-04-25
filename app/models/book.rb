# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, as: :commentable, dependent: :destroy

  paginates_per 20
  validates :title, presence: true
end
