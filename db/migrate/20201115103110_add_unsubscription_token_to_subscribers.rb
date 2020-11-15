class AddUnsubscriptionTokenToSubscribers < ActiveRecord::Migration[6.0]
  def change
    add_column :subscribers, :unsubscription_token, :string
    add_index :subscribers, :unsubscription_token, unique: true

    Subscriber.find_each do |subscriber|
      until subscriber.update unsubscription_token: SecureRandom.hex(32)
        # do nothing
      end
    end
  end
end
