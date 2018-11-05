class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.username}, gods what a stupid name"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account has been successfully updated"
      redirect_to articles_path
    else
      render 'Edit'
    end
  end

  def show

  end

  private
def set_user
  @user = User.find(params[:id])
end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
