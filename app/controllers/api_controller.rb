class ApiController < ApplicationController
  before_action :http_basic_authenticate
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Credential.http_basic_user && password == Credential.http_basic_password
    end
  end

end
