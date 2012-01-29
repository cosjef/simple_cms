class SectionsUpdate < ActiveRecord::Migration
  def up
  add_column :sections, :content, :text
  end

  def down
  end
end
