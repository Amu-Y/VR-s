Rails.application.routes.draw do
  #ユーザー側ルーティング
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  scope module: :public do
    root to: "homes#index"
    get 'about' => 'homes#about'

    resources :users, only: [:create, :show, :edit, :update]

    #チャット機能
    resources :rooms, only: [:create, :show, :index]
    resources :messages, only: [:create, :destroy] do
      resources :favorites, only: [:create, :destroy]
    end
    #検索機能
    resources :homes, only: [:index]
    #情報機能
    resources :informations, ony:[:index, :show]
    get 'beginner' => 'informations#beginner'
  end

  #管理者側ルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

   namespace :admin do
    #ユーザー、ルーム、ジャンル、情報管理
    resources :users, ony:[:index, :update]
    resources :rooms, only:[:index, :edit, :update, :destroy]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :informations
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
