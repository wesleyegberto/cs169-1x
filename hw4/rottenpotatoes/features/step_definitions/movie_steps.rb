Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create movie # save the movie to database
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, director|
  assert Movie.find_by_title(title).director = director
end
