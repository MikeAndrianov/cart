class Admin::BaseController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.credentials.basic_auth.login,
    password: Rails.application.credentials.basic_auth.password
  )

  layout 'admin'
end
