defmodule DemoGenServer do
  use GenServer

  def start_link do
    state = []
    GenServer.start_link(__MODULE__, state, [name: __MODULE__])
  end

  def all do
   GenServer.call(__MODULE__, :all)
  end

  def store(item) do
    GenServer.cast(__MODULE__, {:store, item})
  end

  def handle_cast({:store, item}, state) do
    new_state = state ++ [item]
    {:noreply, new_state}
  end

  def handle_call(:all, _pid, state) do
    {:reply, state, state}
  end
end
