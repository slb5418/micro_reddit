require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(username: "foo", password: "foobar", 
  		password_confirmation: "foobar")
  	@user.save
  	@post = @user.posts.create(title: "foobar", body: "Example body")
  	@post.save
  	@comment = @post.comments.create(body: "Example body", user_id: @user.id)
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
  	@comment.body = ""
  	assert_not @comment.valid?
  end

  test "body should not be too long" do
  	@comment.body = "a"*201
  	assert_not @comment.valid?
  end
end
