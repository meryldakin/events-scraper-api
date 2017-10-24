class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        email = params[:email]
        if user.present? && user.authenticate(params[:password])
          token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
          render json: {
            user: {
              id: user.id
            },
            token: token
          }
        else
          render json: {error: 'No account or password found'}
        end
    end
end