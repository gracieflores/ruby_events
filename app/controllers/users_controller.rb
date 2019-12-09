class UsersController < ApplicationController
  before_action :require_login, :is_user, except: [:new, :create]

  def new
  end

  def create
    @user = User.create( user_params )
    
    if @user.valid?
      session[:user_id] = @user.id
      flash[:errors] = ["You successfully registered!"]
      redirect_to "/sessions/new"
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users"
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.update(params[:user_id], user_params)
    
    if @user.valid?
      redirect_to "/users/" + @user.id.to_s
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/" + @user.id.to_s
    end
  end

  def destroy
    user = User.find(params[:user_id])
    
    if current_user.id == user.id
      session.clear
      user.destroy
      redirect_to "/users"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end

  def is_user
    if current_user.id != params[:user_id].to_f
      session.clear
      redirect_to "sessions/new"
    end
  end

end
