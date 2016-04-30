defmodule Jobs.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :short_description, :text
      add :description, :text
      add :starts_at, :datetime
      add :ends_at, :datetime
      add :slug, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :organization_id, references(:organizations, on_delete: :nothing)

      timestamps
    end
    create index(:jobs, [:user_id])
    create index(:jobs, [:organization_id])

  end
end
