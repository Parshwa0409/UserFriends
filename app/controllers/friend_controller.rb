class FriendController < ApplicationController
  def new
    @friend = Friend.new()
  end

  def create
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @friend = @user.friends.create(name: get_friends_params[:name], email: get_friends_params[:email], phone_number: get_friends_params[:phone_number])

      if @friend.save
        redirect_to root_path, notice:"Friend Added Successfully :)"
      else
        flash[:alert] = "SOME ERROR OCCURRED, PLEASE TRY AGAIN"
        render :new
      end
      
    end
  end

  def show_all
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      
      @friends_list = @user.friends

      p @friends_list
    end
  end


  private 

  def get_friends_params
    return params.require(:friend).permit(:name, :email, :phone_number)
  end
end
