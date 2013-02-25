module Refinery
  module InternProfiles
    module Admin
      class InternProfilesController < ::Refinery::AdminController

        crudify :'refinery/intern_profiles/intern_profile',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
