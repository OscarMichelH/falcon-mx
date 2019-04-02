class ApplicationController < ActionController::Base
  helper_method :comprobe_admin

  def comprobe_admin
    redirect_to root_path if current_user.nil?
    redirect_to root_path if !current_user.is_admin?
  end
end
