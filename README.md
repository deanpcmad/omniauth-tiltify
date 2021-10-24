# OmniAuth Tiltify

An OmniAuth strategy for Tiltify

## Installation

Add the OmniAuth Tiltify and OmniAuth rails_csrf_protection gems to your Gemfile

```ruby
gem 'omniauth-tiltify'
gem 'omniauth-rails_csrf_protection'
```

## Usage

Create an Application by going to `https://dashboard.tiltify.com/MYUSERNAME/my-account/connected-accounts/applications` (and replacing `MYUSERNAME` with your own username, of course) and hitting the "create application" button.

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tiltify, ENV["TILTIFY_APP"], ENV["TILTIFY_SECRET"]
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: "tiltify",
  uid: 12345,
  info: {
    username: "testuser",
    url: "https://tiltify.com/@testuser",
    first_name: "Test",
    last_name: "User",
    email: "test@test.com",
    avatar: "https://assets.tiltify.com/assets/default-avatar.png",
    name: "Test User"
  },
  credentials: {
    token: "abc123", # OAuth 2.0 access_token, which you may wish to store
    expires: false   # this will always be false
  }
}
```