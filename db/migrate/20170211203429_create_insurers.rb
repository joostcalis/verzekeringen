class CreateInsurers < ActiveRecord::Migration
  def change
    create_table :insurers do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.decimal :insured_amount, precision: 8, scale: 2
      t.text :extra_info
      t.string :affiliate_link
      t.text :meta_description
      t.text :meta_keywords
      t.text :meta_page_title

      t.timestamps null: false
    end
  end
end
