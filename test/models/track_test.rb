require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @track = @user.tracks.build(title: "Lorem Ipsum", description: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @track.valid?
  end

  test "user id should be present" do
    @track.user_id = nil
    assert_not @track.valid?
  end

  test "title should be present " do
    @track.title = "   "
    assert_not @track.valid?
  end

  test "description should be present " do
    @track.description = "   "
    assert_not @track.valid?
  end

  test "title should be at most 80 characters" do
    @track.title = "a" * 81
    assert_not @track.valid?
  end

  test "content should be at most 250 characters" do
    @track.description = "a" * 251
    assert_not @track.valid?
  end

  test "order should be most recent first" do
    assert_equal Track.first, tracks(:most_recent)
  end
end
