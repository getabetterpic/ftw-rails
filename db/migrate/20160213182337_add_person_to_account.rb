class AddPersonToAccount < ActiveRecord::Migration
  def change
    add_reference :accounts, :person, index: true, foreign_key: true
  end
end
