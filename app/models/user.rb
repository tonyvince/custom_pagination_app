class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  PER_PAGE = 5

  devise :database_authenticatable, :registerable, :recoverable, :validatable,
    :jwt_authenticatable, jwt_revocation_strategy: self
end
