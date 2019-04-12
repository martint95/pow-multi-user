use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bum, BumWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bum, Bum.Repo,
  username: "postgres",
  password: "postgres",
  database: "bum_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
