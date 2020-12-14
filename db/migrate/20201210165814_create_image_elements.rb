class CreateImageElements < ActiveRecord::Migration[6.0]
  def change
    create_table :image_elements do |t|
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
