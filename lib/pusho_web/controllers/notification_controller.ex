defmodule PushoWeb.NotificationController do
  use PushoWeb, :controller

  alias Pusho.Notification
  
  def create(conn, _params) do
    {:ok, _, %{body_params: body}} = read_body(conn)

    case body do
      %{"fingerprint" => fingerprint, "payload" => payload} ->
        fingerprint
        |> String.to_atom()
        |> Notification.push(payload)

        response_body = Map.drop(body, ["signature"])
        json(conn, response_body)
      _invalid_body ->
        json(conn, %{error: "fingerprint and payload must be provided"})
    end
  end
end