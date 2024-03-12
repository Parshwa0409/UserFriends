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
    end
  end

  def delete_friend
    friends_list = User.find_by(id: session[:user_id]).friends
    friend = friends_list.find_by(id: params[:id])
    friend.destroy if friend

    redirect_to show_friends_path # Works well
    # redirect_to :show_all # gives error
    # redirect_back(fallback_location: root_path)
  end


  def edit_friend
    session[:friend_id] = params[:id]
  end

  def edit_on_submit
    friend  = User.find_by(id: session[:user_id]).friends.find_by(id: session[:friend_id])
    p params
    if friend.present?

      friend.update(name:params[:name]) if params[:name] != ""
      friend.update(email:params[:email]) if params[:email] != ""
      friend.update(phone_number:params[:phone_number]) if params[:phone_number] !=""
      
      redirect_to root_path
    end
  end

  def show_that_friend
    @friend  = User.find_by(id: session[:user_id]).friends.find_by(id: params[:id])
  end
  

  private 

  def get_friends_params
    return params.require(:friend).permit(:name, :email, :phone_number)
  end
end
