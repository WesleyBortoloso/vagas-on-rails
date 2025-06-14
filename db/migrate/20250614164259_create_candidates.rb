class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.text :resume

      t.timestamps
    end
  end
end
