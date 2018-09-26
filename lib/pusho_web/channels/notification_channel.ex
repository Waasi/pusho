defmodule PushoWeb.NotificationChannel do
  use PushoWeb, :channel

  alias Pusho.Notification

  def join("notification:" <> fingerprint, payload, socket) do
    if authorized?(payload) do
      fingerprint
      |> String.to_atom()
      |> Notification.subscribe(self())

      socket = assign(socket, :fingerprint, fingerprint)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_info({:notify, fingerprint, payload}, socket) do
    push(socket, "notification:#{fingerprint}", %{msg: payload})
    {:noreply, socket}
  end

  def terminate({:shutdown, :closed}, %{assigns: %{fingerprint: fingerprint}}) do
    fingerprint
    |> String.to_atom()
    |> Notification.unsubscribe()

    {:shutdown, :left}
  end

  defp authorized?(_payload), do: true
end
