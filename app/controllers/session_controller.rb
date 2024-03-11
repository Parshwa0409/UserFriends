class SessionController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: get_user_params[:email])

    if user.present? && user.authenticate(get_user_params[:password])
      session[:user_id] = user[:id]
      redirect_to root_path
    else
      flash.now[:alert] = "INVALID EMAIL OR PASSWORD, PLEASE TRY AGAIN!!!"
      render :new
    end

  end

  def destroy
    # reset_session() or session[:user_id] = nil
    session[:user_id] = nil
    redirect_to root_path
  end

  private 

  def get_user_params
    return params.permit(:email,:password)
  end
end
