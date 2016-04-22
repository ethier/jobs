defmodule Jobs.Router do
  use Jobs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "json-api"]

    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug JaSerializer.Deserializer
  end

  # scope "/", Jobs do
  #   pipe_through :browser # Use the default browser stack
  #
  #   get "/", PageController, :index
  # end

  scope "/api", Jobs do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    post "/login", SessionController, :create, as: :login
  end
end
