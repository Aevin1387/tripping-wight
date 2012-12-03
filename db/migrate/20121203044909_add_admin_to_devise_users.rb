class AddAdminToDeviseUsers < ActiveRecord::Migration
  def change
    alter_table(:users) do |t|
      t.binary :admin
    end
  end
end
