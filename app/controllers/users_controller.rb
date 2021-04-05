class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @entreprises = @user.entreprises.order("created_at DESC").limit(3)
  end

end
