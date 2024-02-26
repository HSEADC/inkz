class Api::V1::ApplicationController < ActionController::API
  def decrypt_payload
    jwt = request.headers["Authorization"]
    payload = JWT.decode jwt, Rails.application.credentials.devise_jwt_secret_key!, true, { algorithm: 'HS256' }
  end
end
