class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :number_of_meetings_attended, default: 0
      t.string :password_digest
      t.integer :group_id

      t.timestamps
    end
  end
end
