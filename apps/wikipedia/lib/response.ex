defmodule Wikipedia.Response do

  def convert({:ok, %HTTPoison.Response{body: body, status_code: _status_code}}) do
    body
    |> JSON.decode!
    |> List.delete_at(0)
    |>format
  end

  def convert({:error, %HTTPoison.Error{id: _id, reason: reason} }) do
    IO.inspect "Error in http call #{reason}"
  end

  defp format(response_details) do
    response_details
    |> Enum.zip
    |> Enum.map(fn(x) -> create_struct(x) end)
  end

  defp create_struct({title, description, link}) do
    %Wikipedia.Result{title: title, description: description, link: link, source: 'wikipedia'}
  end
end

