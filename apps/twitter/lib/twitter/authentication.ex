defmodule Twitter.Authentication do

  defp sign_request(request, uri, params) do
    creds = OAuther.credentials(
      consumer_key:    config(:consumer_key),
      consumer_secret: config(:consumer_secret),
      token:           config(:token),
      token_secret:    config(:token_secret)
    )

    OAuther.sign(request, uri, params, creds)
  end

  defp get_oauth_header(values), do: OAuther.header(values)

  defp config(value), do: Application.get_env(:twitter, value)
end
