defmodule Pusho.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(PushoWeb.Endpoint, []),
      supervisor(Pusho.Notification.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Pusho.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    PushoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
