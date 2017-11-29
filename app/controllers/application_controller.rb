class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #skip_before_action :authenticate_user!, except: [:show]
  before_action :getPages, :getEvents, :getArticles

  def getPages
    @allpages = Page.all.order(order: :asc)
  end

  def getEvents
    @allevents = Event.where('is_completed = false and is_publised = true').order(id: :desc)
  end

  def getArticles
    @allarticles = Article.where('is_published = true').order(updated_at: :desc)
  end

  def after_sign_in_path_for(resource)
    if current_user.role_id == 3
      sign_out resource
      flash[:notice] = "Your account has been banned. Please contact the administrator for further details !!!"
      unauthenticated_root_path
    else
      user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    sucampusenv_home_path
  end
end
