# ActiveAdmin::Subnav

Enhanced sub-navigation for nested ActiveAdmin resources.

Currently, the base [ActiveAdmin][] install resets the top navigation menu to
display the nested navigation menu, but it can be confusing to lose the main
navigation context. This project keeps the main navigation visible and displays
a secondary navigation bar for nested resources.

**Note**: Optional belongs_to configurations are not supported!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_admin-subnav'
```

And then execute:

    $ bundle

Add the subnav's styles to your `active_admin.css.scss` stylesheet:

```scss
//= require active_admin/subnav

// Align subnav with main navigation by padding the width of the site's
// titie.
#header div.subnav {
  padding-left: 8.333em;
}
```

## Contributing

1. Fork it ( https://github.com/zorab47/active_admin-subnav/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[ActiveAdmin]: https://github.com/gregbell/active_admin
