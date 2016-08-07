class Users::CustomFailure < Devise::FailureApp
  def redirect_url
    home_path
  end
end