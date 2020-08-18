class AttendencesController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    attendence = Attendence.create(attendence_params)
    @event = Event.find(params[:attended_event_id])
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
    event = Attendence.where(attendee_id: :attendee_id, attended_event_id: :event_id)
    return event.nil?
  end

  def attendence_params
    params.permit(:attended_event_id, :attendee_id)
  end
end
