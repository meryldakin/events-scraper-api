class UserEventsController < ApplicationController


    def index
        render json: current_user.events
    end


    def create
      # byebug
      UserEvents.create(user: current_user, event: event)
      render json: current_user.events
    end

    # private

    def current_user
      @user = User.find(params[:user_id])
    end

    def event
      @event = Event.find(params[:event_id])
    end


end
