defmodule Core.FakeSearch do
  def execute(_query) do
    [
      %Wikipedia.Result{title: "a-title", description: "a-description", link: "a-link", source: "a-source"}
    ]
  end
end
