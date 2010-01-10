# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

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

  def admin_user
    if current_user == nil
      return false
    elsif current_user.admin
      return true
    end
    false
  end

end
