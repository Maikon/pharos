# Pharos

[![CircleCI](https://circleci.com/gh/Maikon/pharos/tree/master.svg?style=svg&circle-token=a4d49e8162a9981b4c65745351cf027c85cde4f9)](https://circleci.com/gh/Maikon/pharos/tree/master)

Welcome to the Pharos Application.

# Running Locally

You need to have Elixir 1.4 installed, and postgres

Clone the repository
> git clone git@github.com:Maikon/pharos.git

Navigate to the root directory
> cd pharos

Install dependencies
> mix deps.get

Compile the code
> mix compile

Build the database (dev env)
> mix ecto.create
> mix ecto.migrate

Build the database (test env)
> MIX_ENV=test mix ecto.create
> MIX_ENV=test mix ecto.migrate

Run the tests
> mix test

Start the server locally
> mix phoenix.server

Navigate to a supported url
> https://localhost:4000/posts

