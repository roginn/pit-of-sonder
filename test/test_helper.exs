ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PitOfSonder.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PitOfSonder.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PitOfSonder.Repo)

