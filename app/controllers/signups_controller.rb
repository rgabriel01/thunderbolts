class SignupsController < ApplicationController
  def create
    user = User.new(**user_params)
    if user.save
      # attempt to create access token
      application = Doorkeeper::Application.find_by(
        id: oauth_application_params[:client_id],
        secret: oauth_application_params[:secret]
      )

      if application.present?
        access_token = Doorkeeper::AccessToken.create!(
          application_id: application.id,
          resource_owner_id: user.id,
          scopes: oauth_application_params[:scopes]
        )
        render json: { access_token: access_token.token }, status: :ok
      else
        render json: { message: 'Unable to create access token.' }, status: :internal_server_error
      end
    else
      render json: { message: 'Unable to signup user.' }, status: :internal_server_error
    end
  end

  private


  def oauth_application_params
    {
      client_id: signup_params[:client_id],
      secret: signup_params[:secret],
      scopes: signup_params[:scopes],
    }
  end

  def user_params
    signup_params.except(:client_id, :secret, :scopes)
  end

  def signup_params
    params
      .permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        :client_id,
        :secret,
        :scopes
      )
        .to_h
        .with_indifferent_access
  end
end
