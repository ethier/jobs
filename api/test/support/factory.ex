defmodule Jobs.Factory do
  use ExMachina.Ecto, repo: Jobs.Repo

  alias Jobs.User

  def factory(:user) do
    %User{
      username: "testuser",
      email: sequence(:email, &"email-#{&1}@example.com"),
      password: "testpassword"
    }
  end
end
