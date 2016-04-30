defmodule Jobs.Job do
  use Jobs.Web, :model

  schema "jobs" do
    field :title, :string
    field :short_description, :string
    field :description, :string
    field :starts_at, Ecto.DateTime
    field :ends_at, Ecto.DateTime
    field :slug, :string
    belongs_to :user, Jobs.User
    belongs_to :organization, Jobs.Organization

    timestamps
  end

  @required_fields ~w(title short_description description starts_at ends_at slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
