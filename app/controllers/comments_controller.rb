class CommentsController < ApplicationController
  before_action :find_event, :authenticate_user!
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]


  def new

  end

  def create
    @comment = @event.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to event_path(@event)

    end
  end

  def destroy
    @comment.destroy
    redirect_to event_path(@event)
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_owner
    unless current_user.id == @comment.user.id
      redirect_to @event
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
