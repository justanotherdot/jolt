# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jolt,
  ecto_repos: [Jolt.Repo]

# Configures the endpoint
config :jolt, JoltWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "asHxm+k5g6HVIEstxEF8YBfgXDK3jpKVvw67DBBptVfaDx2H1w4XS6RBfuY0NlBQ",
  render_errors: [view: JoltWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jolt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
