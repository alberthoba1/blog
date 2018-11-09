class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true
      t.string :email
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
