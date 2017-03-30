defmodule DbService do
  @doc """
  Persist a post to the database

  ## Examples
       iex> DbService.persist("post", %{post_url:  "a-url", description: "a-description"})
       iex> %DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts">,    description: "a-description", id: 15, name: "a-url"}
  """
  @spec persist(String.t, map) :: %DbService.Post{}
  def persist(service_name, data) do
    DbService.PostRepository.create(data[:post_url], data[:description])
  end

  @doc """
  Retrieves all posts from the database

  ## Examples
      iex> DbService.persist("post", %{post_url:  "a-url", description: "a-description"})
      iex> DbService.all()
      iex> [%DbService.Post{__meta__: #Ecto.Schema.Metadata<:loaded, "posts"> description: "a-description", id: 15, name: "a-url"}]
  """
  @spec all() :: list(%DbService.Post{})
  def all() do
    DbService.PostRepository.all()
  end
end
