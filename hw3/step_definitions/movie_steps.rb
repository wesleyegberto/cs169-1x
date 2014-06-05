# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create movie # save the movie to database
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #e1Index = page.body.index(e1)
  #e2Index = page.body.index(e2)
  #assert e1Index < e2Index
  assert /#{e1}.*#{e2}/m =~ page.body
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(',').each do |rating|
    if uncheck == nil
      step %{I check "ratings_#{rating}"}
    else
      step %{I uncheck "ratings_#{rating}"}
    end
  end
end

Then /I should see all the movies/ do
  Movie.find(:all).each do |movie|
    title = movie["title"]
    if page.respond_to? :should
      page.should have_content(title)
    else
      assert page.has_content?(title)
    end
  end
end
