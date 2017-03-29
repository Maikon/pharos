defmodule MemoryDb.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(MemoryDb, []),
    ]

    opts = [strategy: :one_for_one, name: MemoryDb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
