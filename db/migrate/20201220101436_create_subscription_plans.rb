class CreateSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.string :base_currency
      t.decimal :monthly_rate
      t.decimal :annual_rate

      t.timestamps
    end
  end
end
