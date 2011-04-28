class AddKeywordsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :keywords, :string
  end

  def self.down
    remove_column :pages, :keywords
  end
end
