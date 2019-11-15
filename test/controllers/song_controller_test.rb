require 'test_helper'

class SongControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get song_show_url
    assert_response :success
  end

end
