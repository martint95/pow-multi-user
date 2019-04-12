# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bum,
  ecto_repos: [Bum.Repo]

# Configures the endpoint
config :bum, BumWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DEmj1bisnVUxCBEtftt6YBbtqCiAB4Zkyalwvlp22KN78bVQ6KU5vREGto6z6R29",
  render_errors: [view: BumWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bum.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Config Pow
config :bum, :pow,
  user: Bum.Users.User,
  repo: Bum.Repo,
  web_module: BumWeb,
  namespace: :user

# config :bum, :pow,
#   user: Bum.Admin,
#   repo: Bum.Repo,
#   web_module: BumWeb,
#   namespace: :admin


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
