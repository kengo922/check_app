class CreateSoftwares < ActiveRecord::Migration[5.2]
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :version
      t.text :platform_ids
      t.text :url

      t.timestamps
    end
  end
end
