use Mix.Config

config :pusho, PushoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Iegj9a9iX/ZQ/NFz8/wYqHZcMvlz8M89GPJuZeChLXARq6kwyyfYUspJwM+OECL+",
  render_errors: [view: PushoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pusho.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
