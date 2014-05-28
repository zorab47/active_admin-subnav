module ActiveAdmin
  module Subnav
    module MenuExtensions
      extend ActiveSupport::Concern

      included do
        helper_method :sub_menu

        # Facilitate AA submenus by providing the resource class's ID to
        # sub-resources to generate URLs.
        before_action do
          if params[:id] && defined?(resource_class) && params[:"#{resource_class.name.underscore}_id"].nil?
            params[:"#{resource_class.name.underscore}_id"] = params[:id]
          end
        end
      end

      def sub_menu
        active_admin_config.sub_navigation_menu
      end

      # Delegates to super to set @current_tab. Also sets @current_sub_tab to
      # be name of the sub menu tab to mark as current.
      def set_current_tab
        super

        @current_sub_tab =
          if active_admin_config.show_sub_menu?(params[:action])
            active_admin_config.menu_item
          end
      end
    end
  end
end
