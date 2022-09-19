class ModifyVisitColumnsMoreTwo < ActiveRecord::Migration[5.2]
  def change
    change_column_null :visits, :page_id, true
  end
end
