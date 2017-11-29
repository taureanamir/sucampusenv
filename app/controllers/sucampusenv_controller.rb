class SucampusenvController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :db_dump_ps4 , :doc ,:ps5_doc , :jenkins_mail, :references, :events, :home, :banned?, :ps6_doc, :suggestions]

  def index
    if current_user.role_id == 1
      @members = User.order("created_at desc").all
      @is_admin = 1

      @members_recent = User.order("created_at desc").limit(5)

    else
      render :show
    end
  end

  def home
    if user_signed_in?
      if current_user.role_id == 1
        @is_admin = 1
      else
        @is_admin = 0
      end
    end
  end

  # GET /members/new
  def new
    @member = User.new
  end

  # GET /members/1/edit
  def edit
    if params[:ban] == "1"
      User.find(params[:id]).update_attribute('role_id', 3)
      @notice = 'Successfully banned'

    else
      User.find(params[:id]).update_attribute('role_id', 2)
      @notice = 'Successfully unbanned'

    end

    redirect_to sucampusenv_index_path, notice: @notice

  end

  # POST /members
  # POST /members.json
  def create
    @member = User.new(member_params)

    respond_to do |format|
      if @member.save
        format.html {redirect_to @member, notice: 'Member was successfully created.'}
        format.json {render :show, status: :created, location: @member}
      else
        format.html {render :new}
        format.json {render json: @member.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html {redirect_to @member, notice: 'Member was successfully updated.'}
        format.json {render :show, status: :ok, location: @member}
      else
        format.html {render :edit}
        format.json {render json: @member.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html {redirect_to members_url, notice: 'Member was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def doc
  end

  def show
  end

  def jenkins_mail
  end

  def references
  end

  def ps5_doc
  end

  def ps6_doc
  end

  def db_dump_ps4
    send_file("#{Rails.root}/pgdump_ps4.txt", type: "application/txt", x_sendfile: true)
  end

  def suggestions
    send_file("#{Rails.root}/public/suggestions.txt", type: "application/txt", x_sendfile: true)
  end

  def banned?
    if current_user.present? && current_user.role_id == 3
      sign_out current_user
      flash[:error] = "Your account has been suspended !!!"
      sucampusenv_home_path
    end
  end

  def participants_list
    if current_user.role_id == 1
      @all_participants = Participation.find_by_sql("select b.first_name, b.last_name, b.degree, b.fos, b.batch, c.title, c.event_date, c.venue from participations a
              inner join
              users b
              on a.user_id = b.id
              inner join
              events c
              on a.event_id = c.id
              where c.title = '#{params[:event]}';")
    else
      render  :show
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
  def member_params
    params[:member]
  end

end
