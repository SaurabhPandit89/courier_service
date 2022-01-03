class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :id_proof_type
      t.string :id_proof_number
      t.string :email

      t.timestamps
    end
  end
end
