module ActiveAdmin
  module Subnav
    module Page
      extend ActiveSupport::Concern

      def show_sub_menu?(*)
        false
      end
    end
  end
end
