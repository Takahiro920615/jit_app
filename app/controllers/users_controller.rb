class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  

  # private
  #  def load_user
  #   @user = User.find(params[:id])
  #  rescue ActiveRecord::RecordNotFound
  #   redirect_to root_path
  #  end
  
end
