class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.create(user: User.find(params[:user_id]), event: Event.find(params[:event_id]))
    redirect_to '/events'
  end

  def destroy
    attendee = Attendee.find_by(user_id: params[:user_id], event_id: params[:event_id])
    
    if current_user == attendee.user
      attendee.destroy
      redirect_to '/events'
    else
      redirect_to '/events'
    end
  end
end
