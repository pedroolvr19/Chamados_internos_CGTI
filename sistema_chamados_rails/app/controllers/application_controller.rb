class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :authenticated?, :admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticated?
    current_user.present?
  end

  def admin?
    authenticated? && current_user.admin?
  end

  def require_authentication
    redirect_to new_session_path, alert: "Você precisa fazer login para acessar essa página." unless authenticated?
  end

  def require_admin
    redirect_to root_path, alert: "Acesso não autorizado." unless admin?
  end
end
