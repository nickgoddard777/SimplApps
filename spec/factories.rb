Factory.define :page do |t|
	t.name "Home"
	t.page_type "home"
	t.content "This is the page"
end

Factory.define :project do |t|
  t.name "Test"
  t.project_type "Website"
  t.client "Client 1"
  t.description "This is a test project"
end

