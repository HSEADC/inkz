class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  # sign up
  def create
    user = User.new user_params

    if user.save
      render json: {
        messages: "Sign Up Successfully",
        is_success: true,
        jwt: encrypt_payload
      }, status: :ok
    else
      render json: {
        messages: "Sign Up Failed",
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def encrypt_payload
    payload = @user.as_json(only: [:email, :jti])
    token = JWT.encode payload, Rails.application.credentials.devise_jwt_secret_key!, 'HS256'
  end
end
