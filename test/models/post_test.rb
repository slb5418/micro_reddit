require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "foo", password: "foobar", 
      password_confirmation: "foobar")
    @user.save
  	@post = @user.posts.create(title: "foobar", body: "Example body")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = ""
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

  test "body should be present" do
  	@post.body = ""
  	assert_not @post.valid?
  end

  test "body should not be too long" do
  	@post.body = "a"*201
  	assert_not @post.valid?
  end
end
