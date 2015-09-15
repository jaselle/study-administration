class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  # request password reset.
  # you get here when the user entered his email in the reset password form and submitted it.
  def create 
    @user = User.find_by_email(params[:email])

    if not @user
      redirect_to(:back, :alert => 'Benutzer nicht gefunden.')
      return
    end

    # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
    @user.deliver_reset_password_instructions! if @user

    redirect_to(root_path, :notice => 'Eine Mail mit Anweisungen wurde ihnen zugeschickt.')
  end

  # This is the reset password form.
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  # This action fires when the user has sent the reset password form.
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Passwörter stimmen nicht überein."
      render :action => "edit"
      return
    end

    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(root_path, :notice => 'Passwort wurde erfolgreich geändert.')
    else
      render :action => "edit"
    end
  end
end
