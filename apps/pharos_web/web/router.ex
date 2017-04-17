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
    pipe_through :browser

    get "/", PageController, :index
    get "/post", PostController, :new
    post "/post", PostController, :create
    get "/search", SearchController, :index
    post "/search", SearchController, :search
  end
end
