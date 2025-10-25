class Product < ApplicationRecord
  belongs_to :shop
  # ここではバリデーションはまだ。Cで入れる
end
