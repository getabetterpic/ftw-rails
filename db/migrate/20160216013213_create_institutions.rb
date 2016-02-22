class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :institution_type

      t.timestamps null: false
    end
  end
end
