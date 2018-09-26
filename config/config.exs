# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vmbbGFx2sCtevDuunRcf1HP4XFia0sGjk1z47LCQ75L6rIQRH5QCFePgw2v9q5tM",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [default_scope: "user:email"] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "c0fa43e3983513befa50",
  client_secret: "fe28d94ed397f03d14883e2bc8382607b8aa95d6"
