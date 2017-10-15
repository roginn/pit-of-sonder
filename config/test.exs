use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pit_of_sonder, PitOfSonder.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pit_of_sonder, PitOfSonder.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pit_of_sonder_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
