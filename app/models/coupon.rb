class Coupon < ApplicationRecord
  validates :book_id, :code, presence: :true
  belongs_to :book
end