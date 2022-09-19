class RemovePagesFromVisit < ActiveRecord::Migration[5.2]
  def change
    remove_reference :visits, :page, foreign_key: true
  end
end
