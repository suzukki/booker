Rails.application.routes.draw do
  resources :bookers
  #url名からコントローラ名＃アクション名
  #booksというurlにアクセスした時bookersコントローラのbooksアクションが呼び起こされる
  get 'books' => 'bookers#books'
  post 'books' => 'bookers#create'  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #patch '/bookers/:id/book_path' => 'bookers#update'
  patch 'bookers/:id(.:format)/book_path' => 'bookers#update'
  put 'bookers/:id(.:format)/book_path' => 'bookers#update'
end
