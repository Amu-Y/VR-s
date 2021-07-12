Rails.application.routes.draw do
  #ユーザー側ルーティング
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  scope module: :public do
    root to: "homes#home"
    get 'about' => 'homes#about'

    resources :customers,only: [:edit, :update, :show] 
  end
  #管理者側ルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
