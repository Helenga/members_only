class AddTokenDigestToUsers < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :token_digest, :string
  end
end
