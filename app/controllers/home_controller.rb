class HomeController < ApplicationController
  def index
    # if session_user_id is set then show the user's information
    if session[:user_id]
      @user = User.find_by(id:session[:user_id])
    end
  end
end
