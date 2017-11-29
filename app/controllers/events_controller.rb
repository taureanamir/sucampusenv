class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_event

  def index
    @events = Event.all.order(event_date: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.where(event_id: @event).order("created_at DESC")
  end

  def new
    if current_user.role_id == 1
      @event = Event.new
    else
      redirect_to events_path
    end
  end

  def create
    if current_user.role_id == 1
      @event = Event.new(event_params)
      respond_to do |format|
        if @event.save
          format.html {redirect_to @event, notice: 'Event was successfully created.'}
          format.json {render :show, status: :created, location: @event}
        else
          format.html {render :new}
          format.json {render json: @event.errors, status: :unprocessable_entity}
        end
      end
    else
      redirect_to events_path
    end

  end

  def edit
    if current_user.role_id == 1
      @event = Event.find(params[:id])
    else
      redirect_to events_path
    end
  end

  def update
    if current_user.role_id == 1
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render 'new'
      end
    else
      redirect_to events_path
    end
  end

  def destroy
    if current_user.role_id == 1
      @event = Event.find(params[:id])
      @event.destroy
      respond_to do |format|
        format.html {redirect_to events_path, notice: 'Event was successfully destroyed.'}
        format.json {head :no_content}
      end
    else
      redirect_to events_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :event_date, :event_time, :contact, :venue, :is_publised, :is_completed)
  end


end
