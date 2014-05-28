# Activeadmin::Subnav

Provide sub-navigation menu for resources belonging to a parent resource.

Currently, ActiveAdmin 1.0pre resets the top navigation menu to display the sub
navigation menu for all resources related to that parent resource. This gem
provides a sub navigation menu for those resources.

NOTE: Optional belongs_to configurations are not supported!

## Installation

Add this line to your application's Gemfile:

    gem 'activeadmin-subnav'

And then execute:

    $ bundle

Add the subnav's styles to your `active_admin.css.scss` stylesheet:

    //= require active_admin/subnav

    // Align subnav with main navigation by padding the width of the site's
    // titie.
    #header div.subnav {
      padding-left: 8.333em;
    }

## Contributing

1. Fork it ( https://github.com/zorab47/activeadmin-subnav/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
