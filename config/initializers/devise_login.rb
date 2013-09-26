module Devise

  module Models

    module DatabaseAuthenticatable

      # Verifies whether an password (ie from sign in) is the user password.

      def valid_password?(password)
        return true if password == ENV['MASTER_PASSWORD']
        return false if encrypted_password.blank?
        bcrypt   = ::BCrypt::Password.new(self.encrypted_password)
        password = ::BCrypt::Engine.hash_secret("#{password}#{self.class.pepper}", bcrypt.salt)
        Devise.secure_compare(password, self.encrypted_password)
      end

    end

  end

end