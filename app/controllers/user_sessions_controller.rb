# login controller
class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      # if logged in, directed to home...alternatives?
      redirect_back_or_to(root_path, notice: 'Login erfolgreich.')
    else
      flash.now[:alert] = 'Login fehlgeschlagen.'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Ausgeloggt!')
  end
end
