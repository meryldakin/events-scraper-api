class UserEventsController < ApplicationController


    def index
        render json: current_user.events
    end


    def create
      UserEvent.create(user: current_user, event: event)
      render json: event
    end

    def destroy
      user_event = UserEvent.find_by(event_id: event.id, user_id: current_user)
      user_event.destroy
      render json: event.id
    end

    # private

    def current_user
      @user = User.find(params[:user_id])
    end

    def event
      @event = Event.find(params[:event_id])
    end


end
