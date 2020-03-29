class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :request_path
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました。"
    root_path
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録しました。"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました。"
    root_path
  end

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number])
  end

end
