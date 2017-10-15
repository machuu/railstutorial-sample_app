require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:test_user_1)
    @micropost = Micropost.new(content: "Lorem Ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should not be more than 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
end