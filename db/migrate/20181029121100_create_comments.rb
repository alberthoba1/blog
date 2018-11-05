class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :article, index:true
      t.text :text

      t.timestamps
    end
  end
end
