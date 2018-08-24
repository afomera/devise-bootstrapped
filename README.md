# Devise Bootstrap Form

This gem gives you a nicer place to start customizing views for your Devise model when you're using the [`bootstrap_form`](https://github.com/bootstrap-ruby/bootstrap_form) gem. The `bootstrap_form` gem makes it easier to generate nice-looking Bootstrap forms in Rails. If you're using `bootstrap_form`, this gem will help make your Devise views look the same as the rest of the forms in your application.

It also makes the Devise views simpler, because the code to define forms using `bootstrap_form` is simpler than the code for a "raw" Rails form. So any customization you do to the Devise views will be simpler.

You can find usage information below, but the gist of it is you'll run `rails g devise:views:bootstrap-form` instead of the normal `rails g devise:views`.

If you want to switch back to what Devise gives you, no problem. Just remove the `app/views/devise` folder. You will then use the default Devise views, or you can run the normal Devise `rails g devise:views` generator command and customize the default Devise views.

If you're just looking for Bootstrap markup on your Devise views, and don't want to use `bootstrap_form`, then you should look into the [`devise-bootstrapped`](https://github.com/king601/devise-bootstrapped) gem, or one of its forks.

## Installation

Add these lines to your application's `Gemfile`:

```ruby
gem 'bootstrap', '~> 4.0'
gem "bootstrap_form", ">= 4.0.0.alpha1"
gem 'devise'
gem 'devise-bootstrap-form', github: "lcreid/devise-bootstrap-form"
```

And then execute:
```bash
bundle install
```

There are additional installation instructions for both [`bootstrap_form`](https://github.com/bootstrap-ruby/bootstrap_form#installation) and [`bootstrap`](https://github.com/twbs/bootstrap-rubygem#a-ruby-on-rails) that yu must complete before using `devise-bootstrap-form`.

## Usage

To use the Bootstrap views generator you'll want to have Devise installed per normal installation. Once you've installed Devise and generated your user model you can generate the views with:

```bash
rails generate devise:views:bootstrap-form
```

If you've already generated the Devise views you can use the `-f` argument to force an override, but that will erase any of the changes you've made to the views.

Generate the mailer views from normal Devise, as they're not included in `devise-bootstrap-form`:

```bash
rails generate devise:views -v mailer
```

## Layout

Each of the views in enclosed in the following:

```
<div class="row justify-content-around">
  <div class="col-12 col-sm-8 col-lg-6">
    <!-- the view... -->
  </div>
</div>
```

You may want to adjust to your own tastes. Since the views use Bootstrap rows and columns, they need to be enclosed in a `div` with class `container`. We assume that you've done that in your layout.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Code of Conduct](CODE_OF_CONDUCT.md).

Refer to the [CONTRIBUTING](devise-bootstrap-form/blob/master/CODE_OF_CONDUCT.md) document for more details.

Bug reports and pull requests are welcome on GitHub at https://github.com/lcreid/devise-bootstrap-form.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
