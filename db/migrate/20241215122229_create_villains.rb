class CreateVillains < ActiveRecord::Migration[8.0]
  def change
    create_table :villains, id: :uuid do |t|
      t.string :full_name, null:false, default: ""
      t.string :code_name, null:false, default: ""
      t.string :first_apperance, default: ""
      t.timestamps
    end
  end
end
