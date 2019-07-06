defmodule PokerPlay.StraightTest do
  use ExUnit.Case
  alias PokerPlay.Card

  def hand_initialization(hand_input) do
    hand_input
    |> Card.format_input()
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)
    |> Enum.sort_by(fn x -> x.int_value end)
    |> Enum.reverse()
  end

  test "check whether the hand is straight" do
    hand1 = hand_initialization("Black: AH 2H 3H 4D 5D")
    hand2 = hand_initialization("Black: 2H 3H 4H 5D 6D")
    hand3 = hand_initialization("Black: AH KH QH JD TD")
    assert PokerPlay.Straight.check(hand1) == true
    assert PokerPlay.Straight.check(hand2) == true
    assert PokerPlay.Straight.check(hand3) == true
  end

  test "check whether the hand is not straight Card " do
    cards = hand_initialization("Black: 2H 3H 4H 5D 7D")
    assert PokerPlay.Straight.check(cards) == false
  end
end
