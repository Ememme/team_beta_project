module Accessible
  extend ActiveSupport::Concern

  protected

  def check_user
    flash.clear
    if current_admin_user
      redirect_to(admin_root_path) && return
    elsif current_student
      redirect_to(root_path) && return
    end
  end
end
