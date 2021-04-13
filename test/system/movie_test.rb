require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit movies_url
  
    assert_selector "h1", text: "List of all movies"
  end

  test "creating a movie" do
    visit movies_url

    first_movie_count = Movie.count

    click_on "Add a new movie"

    fill_in "Title", with: "Creating a Movie"
    fill_in "Description", with: "Created this movie successfully!"

    click_on "Create movie"

    assert_text "Movie created successfully"
    assert_equal((first_movie_count + 1), Movie.count)
  end

  test "visiting show movie" do
    @movie = movies(:one)
    visit "movies/#{@movie.id}"
    assert_selector "h1", text: "Movie ##{@movie.id} details"
  end

  test "deleting a movie" do

    first_movie_count = Movie.count

    @movie = movies(:one)
    visit "movies/#{@movie.id}"

    click_on "Delete movie"

    assert_text "Movie deleted successfully"
    assert_equal((first_movie_count - 1), Movie.count)
  end

  test "edit a movie" do

    @movie = movies(:one)
    visit "movies/#{@movie.id}"

    click_on "Edit movie"

    fill_in "Title", with: "Editing a Movie"
    fill_in "Description", with: "Edited this movie successfully!"

    click_on "Update movie"

    assert_text "Movie updated successfully"
    assert_text "Editing a Movie"
    assert_text "Edited this movie successfully!"
  end


end
