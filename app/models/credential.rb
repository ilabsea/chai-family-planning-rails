class Credential
  def self.http_basic_user
    Rails.application.secrets.http_basic_user
  end

  def self.http_basic_password
    Rails.application.secrets.http_basic_password
  end
end
