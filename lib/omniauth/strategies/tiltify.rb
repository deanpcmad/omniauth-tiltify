require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Tiltify < OmniAuth::Strategies::OAuth2

      option :client_options, {
        site: "https://tiltify.com",
        authorize_url: "/oauth/authorize",
        token_url: "/oauth/token"
      }

      uid { raw_info["data"]["id"] }

      info do
        {
          "username" => raw_info["data"]["username"],
          "url" => raw_info["data"]["url"],
          "first_name" => raw_info["data"]["firstName"],
          "last_name" => raw_info["data"]["lastName"],
          "email" => raw_info["data"]["email"],
          "avatar" => raw_info["data"]["avatar"]["src"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v3/user').parsed
      end

    end
  end
end
