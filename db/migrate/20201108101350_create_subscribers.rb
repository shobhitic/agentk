class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.string :email, index: true
      t.string :verification_token, index: true
      t.boolean :verified, default: false
      t.boolean :unsubscribed, default: false

      t.timestamps
    end
  end
end
