class Api::ApplicationController < ActionController::Base

  before_action :basic_authenticate, only: [:login]
  before_action :token_authenticate, except: [:login]

  respond_to :json

  def login
    render json: { user: @user }
  end

  def basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      @user = User.find_by_username(username)
      @user && @user.valid_password?(password)
    end
  end

  def token_authenticate
    authenticate_or_request_with_http_token do |token|
      @user = User.find_by_uuid(token)
      @user
    end
  end

end
