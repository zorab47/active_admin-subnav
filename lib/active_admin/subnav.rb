require "active_admin"

require "active_admin/subnav/version"

require "active_admin/subnav/views/header_with_subnav"

require "active_admin/subnav/extensions/base_controller"
require "active_admin/subnav/extensions/namespace"
require "active_admin/subnav/extensions/page"
require "active_admin/subnav/extensions/resource"
require "active_admin/subnav/extensions/resource_menu"
require "active_admin/subnav/extensions/tabbed_navigation"

module ActiveAdmin
  module Subnav
    class Engine < ::Rails::Engine
    end
  end
end

# Register a TabbedNavigation view for the sub navigation.
ActiveAdmin::ViewFactory.register sub_navigation: ActiveAdmin::Views::TabbedNavigation,
                                  header:         ActiveAdmin::Views::HeaderWithSubnav

ActiveAdmin.after_load do
  ActiveAdmin::BaseController.send :include, ActiveAdmin::Subnav::MenuExtensions
end
