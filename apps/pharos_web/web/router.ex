defmodule PharosWeb.Router do
  use PharosWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PharosWeb do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    get "/post", PostController, :new
    post "/post", PostController, :create
    get "/all_posts", PostController, :show_all
  end

  # Other scopes may use custom stacks.
  # scope "/api", PharosWeb do
  #   pipe_through :api
  # end
end
