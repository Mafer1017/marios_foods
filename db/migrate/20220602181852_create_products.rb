class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:cost, :integer)
      t.column(:country, :string)
      
      t.timestamps
    end
  end
end
