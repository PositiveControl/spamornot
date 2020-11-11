require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user created with role" do
    editor_user = User.create(email:"editor@example.com", password: "123456", role: :editor)

    assert_equal editor_user.role, :editor
  end
end
