defmodule PokerPlay.Straight do
  @ace_high "AKQJT98765432"
  @ace_low "KQJT98765432A"
  def check(cards) do
    ace_high?(cards) || ace_low?(cards)
  end

  #   require IEx

  def ace_high?(cards) do
    cards |> hand_values() |> matches?(@ace_high)
  end

  def ace_low?(cards) do
    cards |> rotated_hand_values() |> matches?(@ace_low)
  end

  defp matches?(hand_values, all_values) do
    all_values
    |> :binary.match(hand_values)
    |> Kernel.!=(:nomatch)
  end

  def hand_values(cards) do
    cards
    |> Enum.map(fn x -> x.value end)
    |> Enum.join()
  end

  def rotated_hand_values(cards) do
    [head | tail] = Enum.map(cards, fn x -> x.value end)

    Enum.join(tail ++ [head])
  end
end
