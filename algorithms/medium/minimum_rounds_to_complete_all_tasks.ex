defmodule Solution do
  @spec minimum_rounds(tasks :: [integer]) :: integer
  def minimum_rounds(tasks) do
    tasks
    |> Enum.reduce(%{}, fn t, acc -> Map.update(acc, t, 1, &(&1 + 1)) end)
    |> Enum.reduce_while(0, fn {_, v}, ans ->
      if v == 1 do
        {:halt, -1}
      else
        {:cont, ans + ceil(v / 3)}
      end
    end)
  end
end
