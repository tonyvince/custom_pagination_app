# spec/support/auth_helpers.rb

module AuthHelpers
  def auth_token_for_user(user)
    post new_user_session_path, params: {
      user: {
        email: user.email,
        password: user.password
      }
    }

    # Extract the token from the response headers
    response.headers['Authorization'].split(' ').last
  end
end
