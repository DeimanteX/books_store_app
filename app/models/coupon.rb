class Coupon < ApplicationRecord
  validates :book_id, :code, presence: :true
  belongs_to :book

  before_validation :generate_code

  def generate_code
      self.code ||= SecureRandom.hex(6)
  end
end