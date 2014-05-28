
module ActiveAdmin
  module Views
    class TabbedNavigation

      # Overridden
      def build_menu_item(item)
        li id: item.id do |li|
          li.add_class "current" if item.current?(assigns[:current_tab]) || item.current?(assigns[:current_sub_tab])

          text_node link_to item.label(self), item.url(self), item.html_options

          if children = item.items(self).presence
            li.add_class "has_nested"
            ul do
              children.each{ |child| build_menu_item child }
            end
          end
        end
      end
    end
  end
end
