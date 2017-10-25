class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        events = user.events
        email = params[:email]
        if user.present? && user.authenticate(params[:password])
          token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
          render json: {
            user: {
              id: user.id,
              first_name: user.first_name,
              last_name: user.last_name
            },
            token: token,
            events: events
          }
        else
          render json: {error: 'No account or password found'}
        end
    end

    def show
        jwt = JWT.decode(params[:token], ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
        user = User.find(jwt[0]["user_id"])
        events = user.events
        if user
          render json: {
              user: {
                id: user.id,
                first_name: user.first_name,
                last_name: user.last_name
              },
              events: events
          }
        else
          render json: {error: 'No user found'}
        end
    end

end
