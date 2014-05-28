require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/spec/expect'

require 'active_admin/subnav'
require 'sass-rails'

class Minitest::SharedExamples < Module
  include Minitest::Spec::DSL
end

ResourceMenuSpec = Minitest::SharedExamples.new do
  it "to have sub navigation menu name accessor" do
    expect(resource).to_respond_to :sub_navigation_menu_name
    expect(resource).to_respond_to :sub_navigation_menu_name=
  end

  it "is a sub menu item when sub_navigation_menu_name is set" do
    expect(resource.sub_menu_item?).to_equal false
    resource.sub_navigation_menu_name = "Dashboard"
    expect(resource.sub_menu_item?).to_equal true
  end
end

describe "activeadmin-subnav" do
  it "registers a sub navigation view" do
    expect(ActiveAdmin::ViewFactory.new.default_for(:sub_navigation)).to_equal ActiveAdmin::Views::TabbedNavigation
  end

  it "registers a header with subn navigation" do
    expect(ActiveAdmin::ViewFactory.new.default_for(:header)).to_equal ActiveAdmin::Views::HeaderWithSubnav
  end

  def namespace
    app = ActiveAdmin::Application.new
    app.namespace(:admin)
  end

  describe "extends ActiveAdmin::Namespace" do
    it "adds sub menus" do
      expect(namespace).to_respond_to :sub_menus
    end
  end

  describe "extends Page" do
    let(:page) { ActiveAdmin::Page.new(namespace, "Dashboard", {}) }
    alias_method :resource, :page

    include ResourceMenuSpec

    it "to never show sub menus" do
      expect(page.show_sub_menu?).to_equal false
    end
  end

  describe "extends Resource" do
    class Post; end
    let(:resource) { ActiveAdmin::Resource.new(namespace, Post) }

    include ResourceMenuSpec

    it "to assign nested resources" do
      resource.nested_resources = "nested"
      expect(resource.has_nested_resources?).to_equal "nested"
    end
  end
end
