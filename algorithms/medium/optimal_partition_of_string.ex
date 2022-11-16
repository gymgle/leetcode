defmodule Solution do
  @spec partition_string(s :: String.t()) :: integer
  def partition_string(s) do
    s
    |> String.graphemes()
    |> Enum.reduce({0, MapSet.new()}, fn c, {ct, set} ->
      if c in set do
        {ct + 1, MapSet.new([c])}
      else
        {ct, MapSet.put(set, c)}
      end
    end)
    |> elem(0)
    |> then(&(&1 + 1))
  end
end
