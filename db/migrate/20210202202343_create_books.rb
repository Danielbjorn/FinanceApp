

# ----------------------- This is the original scaffold --------------------------- 


class CreateBooks < ActiveRecord::Migration[6.1]


  def change
    create_table :books do |t|


      t.string :title
      t.string :author
      t.float :rating
      t.text :review

      t.timestamps
    end
  end
end


# ----------------------- This is the original scaffold --------------------------- 