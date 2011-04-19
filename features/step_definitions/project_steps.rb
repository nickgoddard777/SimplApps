Given /^I have the following project records$/ do |table|
  table.hashes.each do |hash|
  	Factory(:project, hash)
  end
end


Given /^I have no projects$/ do
  Project.delete_all
end

Then /^I should have ([0-9]+) project$/ do |count|
  Project.count.should == count.to_i
end

