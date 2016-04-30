defmodule Jobs.Repo.Migrations.AddAuthenticationFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :given_name, :string
      add :family_name, :string
      add :additional_name, :string
      add :current_sign_in_at, :datetime
      add :last_sign_in_at, :datetime
      add :sign_in_count, :integer
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
    end
  end
end
