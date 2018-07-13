class HomeController < ActionController::Base
  def create
    user = User.find_or_create_by(name: params[:user_name])
    session[:user] = user.as_json
    redirect_to grids_path
  end

  def index
    session[:user] = nil
  end

  def leader_board
    @users = User.joins(:grids).select("users.*, count(grids.id) as color_count").group("users.id").order("color_count DESC")
  end
end
