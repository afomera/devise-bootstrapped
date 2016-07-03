# Devise::Bootstrapped

This gem tries to give you a nicer place to start with your views for your Devise model when you're using Bootstrap 3.

You can find usage information below, but the gist of it is you'll run `rails g devise:views:bootstrapped` instead of the normal devise:views.

If you want to switch back to what Devise gives you no problem! Just remove the devise views folder and run the normal Devise generator command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise-bootstrapped', github: 'king601/devise-bootstrapped'
```

And then execute:

    $ bundle


## Usage

To use the Bootstrap views generator you'll want to have Devise and Bootstrap installed per normal installation... and once you have installed Devise and generated your user model you can copy over the views with

`rails generate devise:views:bootstrapped`

If you've already generated the Devise views you can use the -f argument to force an override but that will erase any of the changes you've made!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/king601/devise-bootstrapped. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
