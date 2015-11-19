Given /^I am on the blog homepage$/ do
	visit("/posts")
end

When /^I am on the post page$/ do
  visit("/posts")
end

And /^there are already (\d) posts$/ do |count|
	count.to_i.times do |n|
  	  Post.create!({  :title => "Title #{n}", :content => "Content #{n}", :post_time => Time.now })
	end
end

Then /^I can see list of (\d) posted blogs$/ do |count|
  page.should have_selector("table#posts-list>tr:eq(#{count})")
end

When /^I click "(.*?)" button$/ do |btn|
  click_button btn
end
