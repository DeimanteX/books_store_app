class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
