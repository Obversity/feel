class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.text :content
      t.string :user_agent
      t.string :ip

      t.timestamps
    end
  end
end
