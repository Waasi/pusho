defmodule PushoWeb.Plugs.Auth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, [api_key: key]) do
    with body = format(conn),
         signed_body = sign(body, key),
         %{body_params: %{"signature" => signature}} <- conn,
         true <- signature == signed_body do
      conn
    else
      _invalid_request ->
        response_body = Poison.encode!(%{error: "unauthorized request"})

        conn
        |> send_resp(403, response_body)        
        |> halt()
    end
  end

  defp format(%{body_params: body_params}) do
    body_params
    |> Map.drop(["signature"])
    |> Poison.encode!()
  end
  defp format(_conn), do: ""

  defp sign(body, key) do
    :sha256
    |> :crypto.hmac(key, body)
    |> Base.encode16(case: :lower)
  end
end