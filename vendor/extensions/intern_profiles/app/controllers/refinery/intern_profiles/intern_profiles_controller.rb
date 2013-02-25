module Refinery
  module InternProfiles
    class InternProfilesController < ::ApplicationController

      before_filter :find_all_intern_profiles
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @intern_profile in the line below:
        present(@page)
      end

      def show
        @intern_profile = InternProfile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @intern_profile in the line below:
        present(@page)
      end

    protected

      def find_all_intern_profiles
        @intern_profiles = InternProfile.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/intern_profiles").first
      end

    end
  end
end
