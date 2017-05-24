module ActiveAdmin
  class Page
    def belongs_to(target, options = {})
      @belongs_to = Resource::BelongsTo.new(self, target, options)
      self.sub_navigation_menu_name = target
      controller.send :belongs_to, target, options.dup
    end

    def show_sub_menu?(*)
      false
    end
  end
end
