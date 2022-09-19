class AddPagesToVisitAgain < ActiveRecord::Migration[5.2]
  def change
    add_reference :visits, :page, index: true
  end
end
