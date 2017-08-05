class User < ApplicationRecord

has_many :rumors

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.+\a-z\d]+\.[a-z]+\z/i
validates :name, presence: true, uniqueness: true
validates :email, presence: true, length: {maximum: 100},
					format: {with: VALID_EMAIL_REGEX},
					uniqueness: {case_sensetive: true}
validates :password, presence: true, length: {minimum: 5}
has_secure_password

attr_accessor :remember_token

def create_token
	#Записываем в переменную экземпляра сгенерированный код
	self.remember_token = SecureRandom.urlsafe_base64 
	#Сохраняем шифрованный токен в БД
	update_attribute(:token_digest, User.digest(remember_token))
end

#Метод для шифрования токена
def User.digest(token)
	cost = ActiveModel::SecurePassword.min_cost ?
				BCrypt::Engine::MIN_COST :
				BCrypt::Engine.cost
		BCrypt::Password.create(token, cost: cost)
end

#Обнулить токен в БД
def delete_token
	update_attribute(:token_digest, nil)
end

# Расшифровка токена для проверки на совпадение
def authenticated?(token)
	BCrypt::Password.new(token_digest) == token
end

end
