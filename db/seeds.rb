# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Page.delete_all

["home", "about", "contact", "services" ].each do |page_type|
  Page.create(:name=>page_type, :page_type => page_type, :content => "coming soon",:keywords => "change")
end

