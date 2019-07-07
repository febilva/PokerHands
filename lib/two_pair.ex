defmodule PokerPlay.TwoPair do
  def check(arranged_card_values) do
    find_pair_at(arranged_card_values, 0, 2) && find_pair_at(arranged_card_values, 1, 2)
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
