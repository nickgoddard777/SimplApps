Given /^I have the following page records$/ do |table|
  table.hashes.each do |hash|
  	Factory(:page, hash)
  end
end

Given /^I have no pages$/ do
  Page.delete_all
end

Then /^I should have ([0-9]+) page$/ do |count|
  Page.count.should == count.to_i
end

