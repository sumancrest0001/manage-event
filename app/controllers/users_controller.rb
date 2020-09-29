class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @organized_events = @user.events
    @attended_events = @user.attended_events
  end
end
