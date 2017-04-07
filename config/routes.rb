require 'faq_constraint.rb'

Rails.application.routes.draw do
  devise_for :admins, path: '/admins', controllers: { sessions: 'admins/sessions' }

  root 'home#index'

  resources :insurers, only: [:index, :show], path: 'uitvaart-verzekeraars'
  resources :questions, only: [:index, :show], path: 'veelgestelde-vragen' do
    collection do
      get :faq_filter
    end
  end
  resources :test_form_templates, only: [:show], path: 'vind-jouw-verzekering' do
    resources :test_forms, path: 'doe-nu-de-verzekerings-check'
  end

  resources :test_forms, path: 'doe-nu-de-verzekerings-check' do
    resources :form_questions, path: 'vragen' do
      resources :form_answers
    end
  end

  get '/game' => 'games#show'

  namespace :admins do
    get '/control-panel', to: 'control_panel#show'

    resources :insurers
    resources :questions do
      resources :answers
    end
    resources :test_form_templates do
      resources :form_questions
    end
  end

  namespace 'veelgestelde_vragen' do
    get '/' => 'faqs#index', as: 'faq_root'
    get '/:insurer_id/:question_id' => 'faqs#index', constraints: FaqConstraint
  end

end
