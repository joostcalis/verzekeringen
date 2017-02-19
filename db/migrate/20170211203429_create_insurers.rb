class CreateInsurers < ActiveRecord::Migration
  def change
    create_table :insurers do |t|
      t.string  :slug, add_index: true, unique: true
      t.string  :name, add_index: true, unique: true
      t.text    :description
      t.string  :logo
      t.decimal :price, precision: 8, scale: 2
      t.decimal :insured_amount, precision: 8, scale: 2
      t.text    :extra_info
      t.string  :affiliate_link, add_index: true, unique: true
      t.boolean :published
      t.text    :meta_description
      t.text    :meta_keywords
      t.text    :meta_page_title, add_index: true, unique: true

      t.timestamps null: false
    end
  end
end
