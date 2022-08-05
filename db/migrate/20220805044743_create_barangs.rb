class CreateBarangs < ActiveRecord::Migration[7.0]
  def change
    create_table :barangs do |t|
      t.string :nama
      t.string :harga

      t.timestamps
    end
  end
end
