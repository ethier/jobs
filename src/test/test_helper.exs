{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Jobs.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Jobs.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Jobs.Repo)
