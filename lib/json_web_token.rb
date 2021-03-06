require "jwt"
class JsonWebToken
  def self.encode(payload, expiration = 24.hours.from_now)
    # payload = payload.dup
    payload["exp"] = expiration.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base,
               true, algorithm: "HS256")
  end
end
