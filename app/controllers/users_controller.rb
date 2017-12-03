class UsersController < ApplicationController
  # before_filter :authenticate_user!

  def index
     @users = User.all
     @directories = current_client.directories
  end

  def show
    @user = User.find(params[:id])
  end

 
end
