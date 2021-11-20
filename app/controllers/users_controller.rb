class UsersController < ApplicationController

def show
  @user = User.find(params[:id]) 
end

def edit
  @user = User.find(params[:id]) 
end

def update
  @user = User.find(params[:id])
  if @user.update(params.require(:user).permit(:name,:email,:introduction))
    redirect_to user_path(id: current_user.id) 
  else
    redirect_to "edit"
  end
end

  
end
