defmodule PokerPlay.ThreeOfKindTest do
  use ExUnit.Case
  alias PokerPlay.{Card}
  alias PokerPlay

  test "it should return true if it find a Three of kind Card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 9D 5S 9C 9D")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.ThreeOfKind.check(arranged_cards_values) == true
  end

  test "it should return false if it find a Three of kind Card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 9D 5S 9C KD")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.ThreeOfKind.check(arranged_cards_values) == false
  end
end
