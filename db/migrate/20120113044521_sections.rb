class Sections < ActiveRecord::Migration
	  def up
	    add_column :Sections, :name, :string
	    add_column :Sections, :position, :integer
	    add_column :Sections, :visible, :boolean, :default => false
	    add_column :Sections, :content_type, :string
	    add_column :Sections, :page_id, :integer
	    add_index  :Sections, :page_id

	  end

	  def down
	    remove_index  :Sections, :page_id
	    remove_column :Sections, :name
	    remove_column :Sections, :position
	    remove_column :Sections, :visible
	    remove_column :Sections, :content_type
	    remove_column :Sections, :page_id
	  end
	end