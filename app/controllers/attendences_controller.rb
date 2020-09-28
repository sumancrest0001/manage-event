class AttendencesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_event, only:[:create, :index, :new]

  def create
    attendence = @event.attendences.create(attendee_id: current_user.id)
    if attendence.save
      Notification.create(recipient: @event.user, actor: current_user, action: "joined", notifiable: @event)
      flash[:success] = 'You joined the event'
    else
      flash[:danger] = 'Something went wrong.'
    end
    redirect_back(fallback_location: root_path)

  end


  private

  def check_attendence
    event = Attendence.where(attended_event_id: :event_id)
    return event.nil?
  end

  def set_event 
    @event = Event.find_by(id: params[:event_id])
  end
end
