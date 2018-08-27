## Contributing
If you find a bug or have an idea for a feature:

1. Search the issues to see if the bug has been found, or the feature has already been requested. If so, feel free to add your constructive input to the existing issue. Otherwise...
2. Create an issue describing the bug or feature. We welcome contributions from people like you, so if you want to submit a pull request for the bug or feature, say so in the description of the issue.
3. If you want to submit a pull request, we recommend you wait a few days until we respond to the issue. There is a small chance that we might feel that the feature isn't appropriate for this gem.
4. If you don't want to submit your own pull request, your issue is still welcome and we'll review it and respond appropriately.

## Testing
### Manual and Exploratory Testing
There is a test app in `test/rails_app`.

To use the `devise-bootstrap-form` gem:

```
cd rails_app
# Generate the view in the test app
rails g devise:views:bootstrap_form
rails s -b 0.0.0.0 &
# Navigate to localhost:3000/people/sign_in
```

### Automated Testing

```
rake test
```

## Gotchas
To test that the views work for a model other than the default `User`, the test app uses `Person` as the Devise model. It's a bit frustrating to remember that you can't just cut and paste examples that assume the model is `User`.

## Coding guidelines

This project uses [RuboCop](https://github.com/bbatsov/rubocop) to enforce standard Ruby coding
guidelines. The coding standards are close to the out-of-the-box RuboCop standards. The main differences are:

* We prefer double-quoted strings
* We allow 132 characters per line
* We don't lint most of the Rails-generated files in the test application

Note the Travis build will fail and your PR cannot be merged if the linter finds errors

* Test that your contributions pass with `rake lint`
* The linter is also run as part of the default rake task `rake`
