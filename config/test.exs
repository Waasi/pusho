use Mix.Config

config :pusho, PushoWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
