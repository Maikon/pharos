defmodule PharosWeb.SearchView do
  use PharosWeb.Web, :view

  def capitalize(term) do
    String.capitalize(term)
  end
end
