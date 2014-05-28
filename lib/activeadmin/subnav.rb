require "activeadmin"

require "activeadmin/subnav/version"

require "activeadmin/subnav/views/header_with_subnav"

require "activeadmin/subnav/extensions/base_controller"
require "activeadmin/subnav/extensions/namespace"
require "activeadmin/subnav/extensions/page"
require "activeadmin/subnav/extensions/resource"
require "activeadmin/subnav/extensions/resource_menu"
require "activeadmin/subnav/extensions/tabbed_navigation"

# Register a TabbedNavigation view for the sub navigation.
ActiveAdmin::ViewFactory.register sub_navigation: ActiveAdmin::Views::TabbedNavigation,
                                  header:         ActiveAdmin::Views::HeaderWithSubnav

ActiveAdmin::Page.send :include, ActiveAdmin::Subnav::Page

ActiveAdmin.after_load do
  ActiveAdmin::BaseController.send :include, ActiveAdmin::Subnav::MenuExtensions
end
