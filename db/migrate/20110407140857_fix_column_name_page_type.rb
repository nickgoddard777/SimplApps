class FixColumnNamePageType < ActiveRecord::Migration
  def self.up
    rename_column :pages, :type, :page_type
  end

  def self.down
  end
end

