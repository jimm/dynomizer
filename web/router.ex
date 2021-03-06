defmodule Dynomizer.Router do
  use Dynomizer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Dynomizer.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dynomizer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/schedules", ScheduleController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Dynomizer do
  #   pipe_through :api
  # end
end
