defmodule Twitter.MemoryDb do

  def all do
    [
      {"A-Topic", [%{title: "a-title", description: "a-description", link: "a-link", source: :twitter}]}
    ]
  end

  def store(topic, results) do
  end
end
