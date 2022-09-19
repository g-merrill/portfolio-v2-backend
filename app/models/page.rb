class Page < ApplicationRecord
  belongs_to :parent_page, class_name: :Page, optional: true

  has_many :pages, foreign_key: :parent_page_id

  validates :name, presence: true
end
