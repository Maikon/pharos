defmodule Twitter.MemoryDbTest do
  use ExUnit.Case

  test "fetches all results" do
    [{topic, results}] = Twitter.MemoryDb.all()

    assert topic == "A-Topic"
    assert length(results) == 1
  end

  test "fetched results contains correct fields" do
    [{_, results}] = Twitter.MemoryDb.all()

    first_result = List.first(results)

    assert first_result[:description] == "a-description"
    assert first_result[:link] == "a-link"
    assert first_result[:title] == "a-title"
    assert first_result[:source] == :twitter
  end
end
