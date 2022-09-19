class RemoveNameFromVisit < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :name, :string
  end
end
