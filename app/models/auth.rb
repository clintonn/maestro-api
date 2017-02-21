class Auth

  ALGORITHM = "HS256"

  def self.issue(hash)
    JWT.encode(hash, secret_key, ALGORITHM)
  end

  def self.secret_key
    ENV['JWT_SECRET_KEY']
  end

  def self.decode(hash)
    JWT.decode(hash, secret_key, true, {algorithm: ALGORITHM})
  end
end
