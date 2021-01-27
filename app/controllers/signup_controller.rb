class SignupController < ApplicationController
  def create
    # create a new user with the permitted parameters
    user = User.new(user_params)
    if user.save
      # assigning the user_id as the payload and create a new token-based session
      # using the payload and JWTSessions
      payload = {user_id: user.id}
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      # render final JSON and CSRF tokens to avoid cross-origin request
      # vulnerabilities
      #
      render json: { csrf: tokens[:csrf]}
    else
      render json: {error: user.errors.full_messages.join('')}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
