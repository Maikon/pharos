defmodule Twitter.SearchTest do
  use ExUnit.Case

  test "twitter search returns one result" do
    results =  Twitter.Search.for_topic(%{topic: "a-topic", amount: 1})

    assert length(results) == 1
  end

  test "twitter search returns correct data" do
    results =  Twitter.Search.for_topic(%{topic: "a-topic", amount: 1})

    first_result = results |> List.first

    assert first_result.title == "a-title"
    assert first_result.description == "a-description"
    assert first_result.link == "test-link"
    assert first_result.source == "a-source"
  end
end
