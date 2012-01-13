class Pages < ActiveRecord::Migration
	  def up
	  add_column :pages, :name, :string
	  add_column :pages, :permalink, :string
	  add_column :pages, :position, :integer
	  add_column :pages, :visible, :boolean, :default => false
	  add_column :pages, :subject_id, :integer
	  add_index  :pages, :subject_id  
	  add_index  :pages, :permalink
	  end

	  def down
	  remove_index :pages, :subject_id
	  remove_column :pages, :name
	  remove_column :pages, :permalink
	  remove_column :pages, :position
	  remove_column :pages, :visible
	  remove_column :pages, :subject_id
	  end
	end