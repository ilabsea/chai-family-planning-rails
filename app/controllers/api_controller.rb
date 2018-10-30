class ApiController < ApplicationController
  before_action :http_basic_authenticate
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['HTTP_BASIC_USER'] && password == ENV['HTTP_BASIC_PASSWORD']
    end
  end

end
