class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :bucketlist, index: true, foreign_key: true

      t.timestamps
    end
  end
end
