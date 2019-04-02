class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :number

      t.timestamps
    end
  end
end
