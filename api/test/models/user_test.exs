defmodule Jobs.UserTest do
  use Jobs.ModelCase

  alias Jobs.User

  @valid_attrs %{email: "user@example.com", password: "test", username: "username"}
  @invalid_attrs %{email: "some content", password: "test", username: "some content"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
