class Deadline < ActiveRecord::Migration[5.2]
  def change
    add_column:tasks,:deadline,:datetime,default:"2021-07-01 00:00:00" ,null: false
  end
end
