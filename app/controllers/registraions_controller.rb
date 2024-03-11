class RegistraionsController < ApplicationController
  
  def new

    # we are creating this here so that when in form we reference model we reference to the model:user & data is returned as params[:user] 
    @user = User.new()
  end

  def create
    # HERE IS WHERE I GET ALL THE "params" BECAUSE OF POST:METHOD

    @user = User.new(get_user_params())

    if @user.save
      session[:user_id] = @user[:id]
      redirect_to root_path, success: "Sign-Up was a blast, Keep it up bro!!!"
    else
      # flash.now[:alert] = "Sign-Up was unsuccessful, TRY AGAIN!!!", since we are showing errors already we don'thave to do this.
      render :new
    end
  end

  private

  def get_user_params
    return params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation)
  end

end
