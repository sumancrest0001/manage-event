class AttendencesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_event, only: [:create, :index, :new]

  def create
    if check_existing_attendence
      flash[:danger] = 'You have already joined the event'
    else
      attendence = @event.attendences.create(attendee_id: current_user.id)
      if attendence.save
        Notification.create(recipient: @event.user, actor: current_user, action: "joined", notifiable: @event)
        flash[:success] = 'You joined the event'
      else
        flash[:danger] = 'Please enter correct info.'
      end
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def check_existing_attendence
    event = current_user.attendences.where(attended_event_id: params[:event_id])
    return event.exists?
  end

  def set_event
    @event = Event.find_by(id: params[:event_id])
  end
end
