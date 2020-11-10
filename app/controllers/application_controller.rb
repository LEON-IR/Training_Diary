class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :configure_account_update_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_users_path
    when User
      users_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :tel, :is_deleted])

    devise_parameter_sanitizer.permit(:account_update, keys: [:password])
  end

  def configure_account_update_params
  end
end
