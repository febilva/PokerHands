defmodule PokerPlay.FlushTest do
  use ExUnit.Case
  alias PokerPlay
  alias PokerPlay.Card

  test "check wheather the hand is Flush" do
    cards =
      "Black: 2H 3H 4H 5H KH"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    # arranged_cards_value = PokerPlay.arrange_cards(cards)

    assert PokerPlay.Flush.check(cards) == true
  end

  test "check wheather the hand is  not a Flush hand" do
    cards =
      "Black: 2H 3H 4H 6H KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    # arranged_cards_value = PokerPlay.arrange_cards(cards)

    assert PokerPlay.Flush.check(cards) == false
  end
end
