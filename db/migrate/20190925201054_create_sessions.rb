class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
