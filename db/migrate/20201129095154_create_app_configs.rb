class CreateAppConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :app_configs do |t|
      t.string :key, index: true, unique: true
      t.text :value
      t.string :data_type

      t.timestamps
    end
  end
end
