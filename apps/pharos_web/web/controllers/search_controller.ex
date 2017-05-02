defmodule PharosWeb.SearchController do
  use PharosWeb.Web, :controller

  def index(conn, _params) do
    results =
      [
        {"A-Topic", [%{title: "a-title", description: "a-description", link: "a-link", source: :twitter}]}
      ]

    render conn, "index.html", results: results
  end

  def search(conn, query) do
    results = Twitter.Search.execute(query)

    redirect conn, to: search_path(conn, :index)
  end
end
