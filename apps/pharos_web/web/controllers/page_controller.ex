defmodule PharosWeb.PageController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
