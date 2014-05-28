module ActiveAdmin
  class Resource

    # TODO: Support for optional belongs_to
    def belongs_to(target, options = {})
      @belongs_to = Resource::BelongsTo.new(self, target, options)
      self.sub_navigation_menu_name = target
      controller.send :belongs_to, target, options.dup
    end

    def nested_resources=(value)
      @nested_resources = value
    end

    def has_nested_resources?
      @nested_resources
    end

    def show_sub_menu?(action)
      sub_menu_item? || (has_nested_resources? && ["show", "edit"].include?(action))
    end

  end
end
