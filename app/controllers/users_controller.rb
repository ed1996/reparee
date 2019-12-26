class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @entreprises = @user.entreprises
  end

end
