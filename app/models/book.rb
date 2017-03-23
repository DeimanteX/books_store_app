class Book < ApplicationRecord
  belongs_to :user
  has_many :coupons

  default_scope -> { order(created_at: :desc) }
  has_attached_file :photo, styles: { thumb: "300x300" }, default_url: "/images/:style/cat_book.jpg"
  has_attached_file :source

  validates :user_id, presence: true
  validates :title, length: { minimum: 4, maximum: 40 }
  validates :description, length: { minimum: 100, maximum: 250 }
  validates :photo, :source, attachment_presence: true

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
