class ParticipationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #skip_before_action :verify_authenticity_token

  def index
  end

  def new
    @participation = Participation.new
    @participation.user = current_user
    @participation.event = Event.find(params[:event_id])
  end

  def create
    begin
      @participation = Participation.new(participation_params)
      @participation.user = current_user
      @participation.event = Event.find(params[:event_id])
      #@participation.first_name = Participation.new(participation_params[:first_name.to_s])
      #@participation.last_name = Participation.new(participation_params[:last_name])
      #@participation.fos = Participation.new(participation_params[:fos])
      if @participation.save
        redirect_to event_path(@participation.event), notice: "You have been registered !!! "
      else
        render action: 'new'
      end
    rescue ActiveRecord::RecordNotUnique => e
      redirect_to event_path(@participation.event), notice: "You have already registered for the event!!! "
    end

  end

  def destroy
    @participation.destroy
    redirect_to events_path
  end


  private

  def participation_params
    params.require(:participation).permit(:first_name, :last_name, :fos)
    #params.require(:participation).permit( :id, :event_id, :first_name, :last_name, :status)
  end
end
