class AddPagesToVisit < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :page, foreign_key: true
  end
end
