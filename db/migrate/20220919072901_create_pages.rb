class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.references  :visit, index: true

      t.integer     :parent_page_id, index: true
      t.string      :name, null: false, unique: true

      t.timestamps
    end
  end
end
