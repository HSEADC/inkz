class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  
  def favorite_tattoos
    @user = User.find(params[:id])
    @favorite_tattoos = @user.favorite_tattoos
  end
end
