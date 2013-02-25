Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :intern_profiles do
    resources :intern_profiles, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :intern_profiles, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :intern_profiles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
