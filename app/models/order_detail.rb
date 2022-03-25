class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :book, optional: true
  belongs_to :product, optional: true
end
