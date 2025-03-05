class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :register]

    require "jwt"
      def register
    user = User.new(user_params)
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

    # Login user
    def login
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        token = jwt_encode({ user_id: user.id })
        render json: { message: "Login successful", token: token, user: { id: user.id, role: user.role } }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    # Logout (Client-side removes token)
    def logout
      render json: { message: "Logged out successfully" }, status: :ok
    end
  
    # Check authentication
    def check_auth
      if @current_user
        render json: { message: "User authenticated", user: @current_user }, status: :ok
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  
    # Request password reset
    def reset_password_request
        user = User.find_by(email: params[:email])
        return render json: { error: 'User not found' }, status: :not_found unless user
      
        user.update(reset_password_token: SecureRandom.hex(24))
        UserMailer.reset_password_email(user).deliver_now
      
        render json: { message: 'Password reset email sent' }, status: :ok
      end      
  
    # Reset password
    def reset_password
      user = User.find_by(email: params[:email], reset_password_token: params[:token])
  
      if user
        user.update(password: params[:password], reset_password_token: nil)
        render json: { message: "Password reset successfully" }, status: :ok
      else
        render json: { error: "Invalid token or email" }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:email, :password, :role)
    end
  end
  