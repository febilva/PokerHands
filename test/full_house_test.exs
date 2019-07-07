defmodule PokerPlay.FullHouseTest do
  use ExUnit.Case

  alias PokerPlay.{Card}
  alias PokerPlay

  test "it should return true if it find a FullHouse of kind Card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 9D 2S 9C 9D")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.FullHouse.check(arranged_cards_values) == true
  end

  test "it should return false if it find a FullHouse of kind Card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 9D 5S 9C KD")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.FullHouse.check(arranged_cards_values) == false
  end
end
