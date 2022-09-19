class ModifyVisitColumnsMore < ActiveRecord::Migration[5.2]
  def change
    remove_reference :visits, :page, index: true
    add_reference :visits, :page, foreign_key: true
    change_column_null :visits, :page_id, false, 1
  end
end
