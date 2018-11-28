require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  def setup
    @todo = Todo.new(title:"example", content: "this is an example")
  end
  test "recent post must come first in order" do
    assert_equal todos(:most_recent), Todo.first
  end

  test "should be valid" do
    assert @todo.valid?
  end

  test "title should be present" do
    @todo.title = " "
    assert_not @todo.valid?
  end

  test "title should be less than 50 characters" do
    @todo.title = "a" * 51
    assert_not @todo.valid?
  end

  test "content should be less than 250 characters" do
    @todo.content = "a" * 251
    assert_not @todo.valid?
  end

end
