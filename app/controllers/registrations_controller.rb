class RegistrationsController < ApplicationController

  def new
    @user = User.new
    render :new # views/registar
  end

  def create
    @user = User.new(full_name: params[:name], email: params[:email],
                     password: params[:password])
    if @user.save
      redirect_to posts_path
    else
      render :new
    end
  end
end