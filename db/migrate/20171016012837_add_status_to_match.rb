class AddStatusToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :started, :boolean, default: false
    add_column :matches, :finished, :boolean, default: false
  end
end
