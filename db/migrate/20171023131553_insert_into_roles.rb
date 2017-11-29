class InsertIntoRoles < ActiveRecord::Migration[5.1]
  def up
    execute("insert into roles(role_id, role, created_at, updated_at) values(1,'Administrator', current_timestamp,current_timestamp);")
    execute("insert into roles(role_id, role, created_at, updated_at) values(2,'Normal User', current_timestamp,current_timestamp);")
    execute("insert into roles(role_id, role, created_at, updated_at) values(3,'Banned User', current_timestamp,current_timestamp);")
  end
end