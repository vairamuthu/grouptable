class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.integer :user_id, :null=> true, :default => null
      t.string :code, :null => false
      t.timestamps
    end
  end
end
