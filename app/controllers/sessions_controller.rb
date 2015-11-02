class SessionsController < ApplicationController

  def new
    render :new # views/sessions/new.html.erb
  end

  def create 
    user = User.find_by!(email: params[:eamil])
    if user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to posts_path
  end
end
