class ApplicationController < ActionController::Base
  #バリデーション
  before_action :authenticate_user!,except: [:top]
  
  # signup時、nameのデータ操作を許可するアクションメソッドが指定されている
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  #ログイン後投稿一覧画面へ
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
end
