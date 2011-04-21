class AddImageToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :image, :binary
  end

  def self.down
    remove_column :projects, :image
  end
end
