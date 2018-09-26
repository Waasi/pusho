defmodule Pusho.Notification.Server do
  use GenServer

  defstruct fingerprint: nil, channel: nil

  def start_link(fingerprint, channel) do
    GenServer.start_link(__MODULE__, [fingerprint, channel], [name: fingerprint])
  end 
  
  def init(["", _channel]), do: {:error, "notification server must contain a fingerprint"}
  def init([_fingerprint, nil]), do: {:error, "notification server must contain a fingerprint"}
  def init([fingerprint, channel]) do
    state = %__MODULE__{
      channel: channel,
      fingerprint: fingerprint
    }

    {:ok, state}
  end

  def push(server, payload) do
    GenServer.cast(server, {:push, payload})
  end

  def id(server) do
    GenServer.call(server, :id)
  end

  #####
  # Callbacks
  #####

  def handle_call(:id, _from, state) do
    {:reply, self(), state}
  end

  def handle_cast({:push, payload}, %{fingerprint: fingerprint, channel: channel} = state) do
    send(channel, {:notify, fingerprint, payload})
    {:noreply, state}
  end
end