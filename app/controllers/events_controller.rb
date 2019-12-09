class EventsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @events = Event.all.where(state: current_user.state)
    @other_events = Event.all.where.not(state: current_user.state)
  end

  def create
    @event = Event.create( event_params )

    if @event.valid?
      redirect_to '/events'
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to '/events'
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    
    if current_user.id == event.user.id
      event.destroy
      redirect_to "/events"
    end
  end

  def show
    @event = Event.find(params[:event_id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :city, :state).merge(user: User.find(params[:user_id]))
  end

end
