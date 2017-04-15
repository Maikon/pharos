defmodule PharosWeb.SearchViewTest do
  use PharosWeb.ConnCase, async: true

  test "term is capatilized for display purposes" do
    formatted_term = PharosWeb.SearchView.capitalize("pizza")

    assert formatted_term == "Pizza"
  end
end
