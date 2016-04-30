defmodule Jobs.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :legal_name, :string
      add :alternate_name, :string
      add :slug, :string

      timestamps
    end

  end
end
