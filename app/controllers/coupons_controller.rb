class CouponsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create

    code = generate_code
    @coupon = Coupon.new(book_id: params[:book_id], code: code)

    respond_to do |format|
      if @coupon.save
        @book_coupon_path = book_url(@coupon.book_id, :coupon => @coupon.code)
        format.json { render json: { coupon_link: @book_coupon_path}, status: :created }
      else
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def generate_code
      begin
        code = SecureRandom.hex(6)
      end until Coupon.where("code = ?", code).count
      return code
    end
end