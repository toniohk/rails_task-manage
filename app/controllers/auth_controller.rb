class AuthController < ApplicationController
  # POST /auth/signup
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {message: "Invalid email or password"}, status: :bad_request
    end
  end

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])

    if @user.status === 0
      render json: {message: "Your account is inactive now"}, status: :bad_request
    elsif @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {message: "Invalid email or password"}, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:name, :title, :email, :password, :role, :work_focus, :status)
  end
end
