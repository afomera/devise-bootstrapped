## Testing
There is a test app in `test/rails_app`.

To use the `devise-bootstrap-form` gem:

```
cd test/rails_app
bundle config --local local.rails-bootstrap-form ../rails-bootstrap-form
```

(See https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html.)

To use the gem from RubyGems:

```
bundle config --delete local.YOUR_GEM_NAME
```

Then you can:

```
cd rails_app
rails s -b 0.0.0.0 &
```
