class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user #this method will be available to all the controllers cause all the controllers inherit 
    #applicationController, which is the name of this class.
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin#meaning the current_user.admin must equal the boolean of true
      render json: {}, status: :unauthorized 
    end
  end

end
