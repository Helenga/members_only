class CreateRumors < ActiveRecord::Migration[5.1]
  def change
    create_table :rumors do |t|
      t.string :about
      t.string :body
	  t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
