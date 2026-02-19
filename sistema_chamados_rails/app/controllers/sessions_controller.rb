class SessionsController < ApplicationController
  allow_browser versions: :modern
  def new
  end

  def create
    if user = User.authenticate_by(email_address: params[:email_address], password: params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login realizado com sucesso!"
    else
      redirect_to new_session_path, alert: "Email ou senha inválidos."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logout realizado com sucesso!"
  end
end
