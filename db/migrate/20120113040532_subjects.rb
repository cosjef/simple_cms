class Subjects < ActiveRecord::Migration
	  def up
	    add_column :subjects, :name, :string
	    add_column :subjects, :position, :integer
	    add_column :subjects, :visible, :boolean, :default => false
	  end

	  def down
	    remove_column :subjects, :visible
	    remove_column :subjects, :position
	    remove_column :subjects, :name
	  end
	end