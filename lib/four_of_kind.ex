defmodule PokerPlay.FourOfKind do
  def check(arranged_card_values) do
    arranged_card_values
    |> find_pair_at(0, 4)
  end

  @doc """
  this function will return true if it find a pair at the given index
  """
  def find_pair_at(values, index_position, length_of_a_pair) do
    values
    |> Enum.at(index_position)
    |> Kernel.length()
    |> Kernel.==(length_of_a_pair)
  end
end
