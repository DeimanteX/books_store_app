class CouponsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :js

  def create

    @coupon = Coupon.find_by_book_id(params[:book_id])

    unless @coupon.present?
      @coupon = Coupon.create(book_id: params[:book_id])
    end

    respond_to do |format|
      if @coupon.errors.present?
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      else
        @book_coupon_path = book_url(@coupon.book_id, :coupon => @coupon.code)
        format.json { render json: { coupon_link: @book_coupon_path}, status: :created }
      end
    end
  end
end