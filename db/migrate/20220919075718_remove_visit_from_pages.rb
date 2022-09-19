class RemoveVisitFromPages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pages, :visit, foreign_key: true
  end
end
