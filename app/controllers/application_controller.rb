# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b3b25059512caf868c99cf549fa54b07'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  filter_parameter_logging :password

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  helper_method :current_user
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  helper_method :enabled_user
  def enabled_user
    if current_user == nil
      return false
    elsif current_user.admin
      return true
    elsif current_user.enabled
      return true
    end
    false
  end

  helper_method :admin_user
  def admin_user
    if current_user == nil
      return false
    elsif current_user.admin
      return true
    end
    false
  end

  helper_method :can_list_users
  def can_list_users
    admin_user
  end

  helper_method :can_register
  def can_register
    current_user == nil
  end

  helper_method :can_edit_user
  def can_edit_user(user)
    admin_user or (current_user and current_user.id == user.id)
  end

  helper_method :can_edit_fallacy
  def can_edit_fallacy
    admin_user or enabled_user
  end

  helper_method :can_edit_topic
  def can_edit_topic
    admin_user or enabled_user
  end

  helper_method :can_edit_comment
  def can_edit_comment(comment)
    admin_user or (enabled_user and current_user.id == comment.user_id)
  end

  helper_method :can_edit_flag
  def can_edit_flag(flag)
    admin_user or (enabled_user and current_user.id == flag.user_id)
  end

end
