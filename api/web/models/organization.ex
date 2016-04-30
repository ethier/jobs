defmodule Jobs.Organization do
  use Jobs.Web, :model

  schema "organizations" do
    field :legal_name, :string
    field :alternate_name, :string
    field :slug, :string

    timestamps
  end

  @required_fields ~w(legal_name alternate_name slug)
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
