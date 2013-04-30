::Refinery::Application.routes.draw do
  scope(:path => 'admin', :as => 'admin', :module => 'admin') do
    resources :settings,
              :except => :show,
              :as => :refinery_settings,
              :controller => :refinery_settings
  end
end
