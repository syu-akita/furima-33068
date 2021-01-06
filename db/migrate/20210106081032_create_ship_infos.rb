class CreateShipInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_infos do |t|
      t.string        :p_code,        null: false
      t.string        :city,          null: false
      t.string        :address,       null: false
      t.string        :building
      t.string        :phone_num,     null: false
      t.integer       :ship_area,     null: false
      t.references    :order,         foreign_key: true
      t.timestamps
    end
  end
end
