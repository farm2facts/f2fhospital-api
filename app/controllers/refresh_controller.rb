# this links accesss token to the refresh token and refreshes it
# sometimes it's not secure enough to store refresh tokens in web/JS clients

class RefreshController < ApplicationController
  # used as protective layer to protect the endpoint
  before_action :authorize_refresh_by_access_request!

  def create
    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    # exception for if access token is not expired?
    tokens = session.refresh_by_access_payload do
      raise JWTSessions::Errors::Unauthorized, "Somethings not right here!"
    end
    response.set_cookie(JWTSessions.access_cookie,
                        value: tokens[:access],
                        httponly: true,
                        secure: Rails.env.production)
    render json: {csrf: tokens[:csrf]}
  end
end
