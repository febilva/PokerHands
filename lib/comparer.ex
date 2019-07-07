defmodule PokerPlay.Hand.Compare do
  @hands [
    "StraightFlush",
    "FourOfAKind",
    "FullHouse",
    "Flush",
    "Straight",
    "ThreeOfAKind",
    "TwoPairs",
    "Pair",
    "HighCard"
  ]

  def compare(left, right) when left == right, do: {:tie, left}

  def compare(left, right) do
    if hand_rank(left) < hand_rank(right), do: left, else: right
  end

  defp hand_rank(hand) do
    Enum.find_index(@hands, &(&1 == hand))
  end
end
