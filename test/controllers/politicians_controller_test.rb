require "test_helper"

class PoliticiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @politician = politicians(:one)
  end

  test "should get index" do
    get politicians_url, as: :json
    assert_response :success
  end

  test "should create politician" do
    assert_difference("Politician.count") do
      post politicians_url, params: { politician: { academic_preparation: @politician.academic_preparation, active: @politician.active, birth_date: @politician.birth_date, city: @politician.city, district: @politician.district, email: @politician.email, last_degree_of_studies: @politician.last_degree_of_studies, legislative_experience: @politician.legislative_experience, legislature: @politician.legislature, location: @politician.location, name: @politician.name, party: @politician.party, photo_url: @politician.photo_url, relative_majority: @politician.relative_majority, social_links: @politician.social_links, swearing_date: @politician.swearing_date, telephone: @politician.telephone, type: @politician.type } }, as: :json
    end

    assert_response :created
  end

  test "should show politician" do
    get politician_url(@politician), as: :json
    assert_response :success
  end

  test "should update politician" do
    patch politician_url(@politician), params: { politician: { academic_preparation: @politician.academic_preparation, active: @politician.active, birth_date: @politician.birth_date, city: @politician.city, district: @politician.district, email: @politician.email, last_degree_of_studies: @politician.last_degree_of_studies, legislative_experience: @politician.legislative_experience, legislature: @politician.legislature, location: @politician.location, name: @politician.name, party: @politician.party, photo_url: @politician.photo_url, relative_majority: @politician.relative_majority, social_links: @politician.social_links, swearing_date: @politician.swearing_date, telephone: @politician.telephone, type: @politician.type } }, as: :json
    assert_response :success
  end

  test "should destroy politician" do
    assert_difference("Politician.count", -1) do
      delete politician_url(@politician), as: :json
    end

    assert_response :no_content
  end
end
