module ActiveAdmin
  module Subnav
    module PageExtensions
      extend ActiveSupport::Concern

      def show_sub_menu?(*)
        false
      end
    end
  end
end
