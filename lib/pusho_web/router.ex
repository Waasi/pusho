defmodule PushoWeb.Router do
  use PushoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PushoWeb do
    pipe_through :api

    resources "/notifications", NotificationController, only: [:create]
  end
end
