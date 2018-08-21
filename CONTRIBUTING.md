## Testing
### Manual and Exploratory Testing
There is a test app in `test/rails_app`.

To use the `devise-bootstrap-form` gem:

```
cd test/rails_app
bundle config --local local.rails-bootstrap-form ../rails-bootstrap-form
```

(See https://rossta.net/blog/how-to-specify-local-ruby-gems-in-your-gemfile.html.)

Then you can:

```
cd rails_app
# Generate the view in the test app
rails g devise:views:bootstrap_form
rails s -b 0.0.0.0 &
# Navigate to localhost:3000/people/sign_in
```

To go back to using the gem from RubyGems:

```
bundle config --delete local.YOUR_GEM_NAME
```

### Automated Testing
There are a number of automated system tests in the `test/rails_app/test` directory. To run the tests:

```
cd test/rails_app
rails test:system
```

## Gotchas
To test that the views work for a model other than the default `User`, the test app uses `Person` as the Devise model. It's a bit frustrating to remember that you can't just cut and paste examples that assume the model is `User`.
