class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  before_action only:[:edit, :update, :destroy] do
    check_admin (@event.user)
  end
  def new
    @event = Event.new
  end

  def index
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event is successfully created !'
      redirect_to @event
    else
      flash.now[:danger] = 'Something went wrong.'
      render 'new'
    end
  end

  def show
    @related_events = Event.where(user_id: @event.user_id)
    @popular_events = Event.top_3
  end

  def edit
  end

  def update 
    if @event.update event_params
      flash[:success] = 'Event is successfully updated !'
      redirect_to @event
    else
      flash.now[:danger] = 'Something went wrong.'
      render 'edit'
    end
  end

  def destroy
    if @event.destroy
      flash[:success] = 'Event is deleted'
      redirect_back(fallback_location: root_path)
    end
  end



  private

  def set_event 
    @event = Event.find_by(id: params[:id])
  end

  def require_login
    unless current_user
      flash[:danger] = "You must be logged in to access this section"
      redirect_to new_user_session_path 
    end
  end

  def event_params
    params.require(:event).permit(:title, :date, :address, :features, :price, :event_image)
  end

  def check_admin user
    unless current_user.id == user.id
      flash[:danger] = "You are not authorized to perform this action"
      redirect_back(fallback_location: root_path)
    end
  end
end
