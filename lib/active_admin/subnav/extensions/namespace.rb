module ActiveAdmin
  class Namespace

    attr_reader :sub_menus

    # Override reset_menu!
    def reset_menu!
      @menus.clear!
      @sub_menus.clear!
    end

    # Override build_menu_collection
    def build_menu_collection
      @menus     = MenuCollection.new
      @sub_menus = MenuCollection.new

      @menus.on_build do |menus|
        build_default_utility_nav

        resources.each do |resource|
          resource.add_to_menu(@menus)
        end

        @sub_menus.send :build_menus!
      end

      @sub_menus.on_build do |menus|
        resources.each do |resource|
          if resource.belongs_to?
            resource.belongs_to_config.target.nested_resources = true
          end

          resource.add_to_sub_menu(@sub_menus)
        end
      end
    end

  end
end

