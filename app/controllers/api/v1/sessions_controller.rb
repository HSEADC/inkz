class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  skip_before_action :verify_signed_out_user, only: [:destroy]

  # sign in
  def create
    # Rails.logger.info("\e[1;33mSIGN IN FROM FRONTEND\e[0m")

    if @user.valid_password?(sign_in_params[:password])
      sign_in "user", @user

      render json: {
        messages: "Signed In Successfully",
        is_success: true,
        jwt: encrypt_payload
      }, status: :ok
    else
      render json: {
        messages: "Signed In Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  # sign out
  def destroy
    user = User.find_by_jti(decrypt_payload[0]['jti'])

    if user && user.update_column(:jti, SecureRandom.uuid)
      render json: {
        messages: "Signed Out Successfully",
        is_success: true,
        data: {}
      }, status: :ok
    else
      render json: {
        messages: "Signed Out Failed - Unauthorized",
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:sign_in).permit :email, :password
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])

    if @user
      return @user
    else
      render json: {
        messages: "Cannot get User",
        is_success: false,
        data: {}
      }, status: :failure
    end
  end

  def encrypt_payload
    payload = @user.as_json(only: [:email, :jti])
    token = JWT.encode payload, Rails.application.credentials.devise_jwt_secret_key!, 'HS256'
  end

  def decrypt_payload
    jwt = request.headers["Authorization"]
    payload = JWT.decode jwt, Rails.application.credentials.devise_jwt_secret_key!, true, { algorithm: 'HS256' }
  end
end
