module ActiveAdmin
  class Resource
    module Menu
      attr_accessor :sub_navigation_menu_name

      # Override add_to_menu
      def add_to_menu(menu_collection)
        if include_in_menu? && !sub_menu_item?
          @menu_item = menu_collection.add navigation_menu_name, menu_item_options
        end
      end

      def sub_navigation_menu
        if has_nested_resources? && !sub_menu_item?
          menu = resource_name.to_s.underscore.to_sym
          namespace.sub_menus.fetch(menu)
        else
          namespace.sub_menus.fetch(sub_navigation_menu_name)
        end
      end

      def add_to_sub_menu(menu_collection)
        if include_in_menu? && sub_menu_item?
          @menu_item = menu_collection.add sub_navigation_menu_name, menu_item_options
        end
      end

      def sub_menu_item?
        !sub_navigation_menu_name.nil?
      end
    end
  end
end
