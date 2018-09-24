defmodule Pusho.Notification.Supervisor do
  use DynamicSupervisor

  alias Pusho.Notification.Server

  def start_link do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_child(fingerprint, channel) do
    spec = %{id: Server, start: {Server, :start_link, [fingerprint, channel]}}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  @impl true
  def init(_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end