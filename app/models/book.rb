class Book < ApplicationRecord
    belongs_to :product
    belongs_to :category
    has_many :order_detail
end