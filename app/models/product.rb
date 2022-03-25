class Product < ApplicationRecord
    has_many :book
    has_many :order_detail
end
