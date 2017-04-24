defmodule Twitter.Search do
  def execute(_query) do
    [
      %Twitter.Result{title: "a-title", description: "a-description", link: "test-link", source: "a-source"}
    ]
  end
end
