defmodule Jobs.JobTest do
  use Jobs.ModelCase

  alias Jobs.Job

  @valid_attrs %{description: "some content", ends_at: "2010-04-17 14:00:00", short_description: "some content", slug: "some content", starts_at: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
