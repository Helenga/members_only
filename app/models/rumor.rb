class Rumor < ApplicationRecord
belongs_to :user

def author
	id = self.user_id
	User.find(id).name
end
	
end
