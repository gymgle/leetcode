defmodule Solution do
  @spec min_steps(s :: String.t(), t :: String.t()) :: integer
  def min_steps(s, t) do
    s = s_to_map(s)
    t = s_to_map(t)

    for c <- ?a..?z, reduce: 0 do
      acc ->
        acc + abs(Map.get(s, c, 0) - Map.get(t, c, 0))
    end
  end

  def s_to_map(s) do
    s
    |> String.graphemes()
    |> Enum.reduce(%{}, fn c, m ->
      Map.update(m, :binary.first(c), 1, &(&1 + 1))
    end)
  end
end
