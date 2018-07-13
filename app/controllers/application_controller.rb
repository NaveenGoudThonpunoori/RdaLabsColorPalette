# Parent Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_session

  private

  def check_session
    if !session[:user].present?
      redirect_to home_index_path
    end
  end

end
