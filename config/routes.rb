Rails.application.routes.draw do
  root to: 'welcome#index'
  devise_for :teachers, controllers: { omniauth_callbacks: 'teachers/omniauth_callbacks' }
  devise_scope :teacher do
    get 'teachers/sign_in', to: 'teachers/sessions#new', as: :new_teacher_session
    get 'teachers/sign_out', to: 'teachers/sessions#destroy', as: :destroy_teacher_session
  end
end
