class Auth

  ALGORITHM = "HS256"

  def self.secret_key
    ENV['JWT_SECRET_KEY']
  end

  def self.decode(hash)

  end

  def self.encrypt(hash)
    JWT.encode(hash, secret_key, ALGORITHM)
  end
end
