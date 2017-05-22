defmodule Core.RealSearch do

  def execute(%{"topic" => topic, "amount" => amount}) do
    connect_nodes()

    query = %{topic: topic, amount: String.to_integer(amount)}

    result = Application.get_env(:pharos_web, :children_nodes)
    |> Enum.map(fn({node, module}) -> call(node, module, query) end)
    |> List.flatten

    MemoryDb.store(topic, result)
  end

  defp call(node, module, query) do
    :rpc.call(node, module, :for_topic, [query])
  end

  defp connect_nodes do
    Application.get_env(:pharos_web, :parent_node)
    |> Node.start

    Application.get_env(:pharos_web, :children_nodes)
    |> Enum.each(fn({node, _module}) ->
      Node.connect(node)
    end)
  end
end
