defmodule Jobs.User do
  use Jobs.Web, :model

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(username email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> hash_password
    |> unique_constraint(:username, on: Repo)
    |> unique_constraint(:email, on: Repo)
    |> validate_format(:email, ~r/@/)
  end

  defp hash_password(model) do
    case get_change(model, :password) do
      nil -> model
      password -> put_change(model, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
    end
  end
end
