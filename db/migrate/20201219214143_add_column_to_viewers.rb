class AddColumnToViewers < ActiveRecord::Migration[5.0]
  def change
    add_column :viewers, :name, :string
  end
end
