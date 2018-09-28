defmodule PushoWeb.Router do
  use PushoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug PushoWeb.Plugs.Auth, [api_key: System.get_env("PUSHO_API_KEY")]
  end

  scope "/api", PushoWeb do
    pipe_through :api

    resources "/notifications", NotificationController, only: [:create]
  end
end
