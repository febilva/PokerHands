defmodule PokerPlay.PairTest do
  use ExUnit.Case
  alias PokerPlay
  alias PokerPlay.Card

  test "check whether the hand is pair of kind" do
    cards =
      "Black: 2H 2D 5S 5C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    arranged_cards_value = PokerPlay.arrange_cards(cards)

    assert PokerPlay.Pair.check(arranged_cards_value, cards) == true
  end

  test "check whether the hand is not a pair of kind" do
    cards =
      "Black: 2H 3D 6S 5C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    arranged_cards_value = PokerPlay.arrange_cards(cards)

    assert PokerPlay.Pair.check(arranged_cards_value, cards) == false
  end
end
