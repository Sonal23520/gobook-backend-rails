Rails.application.routes.draw do

  get 'books/book_by_category/:category_id', to: 'books#book_by_category'
  get 'books/get_books_by_grade/:grade', to: 'books#get_books_by_grade'
  get 'books/get_latest_book', to: 'books#get_latest_book'

  resources :order_details
  resources :orders
  resources :books
  resources :products
  resources :categories

end
