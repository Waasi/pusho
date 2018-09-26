defmodule Pusho.Notification do
  alias Pusho.Notification.{Server, Supervisor}

  def subscribe(fingerprint, channel) do
    Supervisor.start_child(fingerprint, channel)
  end

  def unsubscribe(fingerprint) do
    fingerprint
    |> Server.id()
    |> Supervisor.terminate_child()
  end

  def push(fingerprint, payload) do
    Server.push(fingerprint, payload)
  end
end