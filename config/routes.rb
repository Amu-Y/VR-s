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
      resource :favorites, only: [:create, :destroy]
    end

    # 検索機能
    resources :homes, only: [:index]
  end

  #管理者側ルーティング
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

   namespace :admin do

    resources :users, ony:[:index, :update]
    resources :rooms, only:[:index, :edit, :update, :destroy]
    resources :genres, only:[:index, :edit, :create, :update]

   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
