module Refinery
  module InternProfiles
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::InternProfiles

      engine_name :refinery_intern_profiles

      initializer "register refinerycms_intern_profiles plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "intern_profiles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.intern_profiles_admin_intern_profiles_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/intern_profiles/intern_profile',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::InternProfiles)
      end
    end
  end
end
