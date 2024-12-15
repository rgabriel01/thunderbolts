class CreateTeamMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :team_members, id: :uuid do |t|
      t.string :full_name, null:false, default: ""
      t.string :code_name, null:false, default: ""
      t.timestamps
    end
  end
end
