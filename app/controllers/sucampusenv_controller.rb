class SucampusenvController < ApplicationController
  before_action :authenticate_user!, except: [:events, :home]
  before_action :assign_member



  def home

  end

  def participants_list
    if current_user.role_id == 1
      query = Participation.escape_sql(["select b.first_name, b.last_name, b.degree, b.fos, b.batch, c.title, c.event_date, c.venue, c.title from participations a
              inner join
              users b
              on a.user_id = b.id
              inner join
              events c
              on a.event_id = c.id
              where c.title = '#{params[:event]}';"])
      @all_participants = Participation.find_by_sql(query)
    else
      render  :home
    end
  end

  def articles_list
    if current_user.role_id == 1
      @articles = Article.all.order(updated_at: :desc)
    else
      redirect_to articles_path
    end
  end

  def my_articles
      @my_articles = Article.where(user_id: current_user.id).order("updated_at DESC")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def assign_member
    if user_signed_in?
      if current_user.role_id == 1
        @is_admin = 1
      else
        @is_admin = 0
      end
    end
  end

end
