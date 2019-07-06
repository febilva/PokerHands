defmodule PokerPlay.TwoPairTest do
  use ExUnit.Case

  alias PokerPlay.{Card}
  alias PokerPlay

  test "it should return true if it find a pair at the given index position" do
    list = [[1, 2], [2]]
    assert PokerPlay.TwoPair.find_pair_at(list, 0, 2) == true
  end

  test "it should return false if it find a pair at the given index position" do
    list = [[1], [2]]
    assert PokerPlay.TwoPair.find_pair_at(list, 0, 2) == false
  end

  test "it should return true if the hand is Two pair kind of card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 2D 5S 9C 9D")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.TwoPair.check(arranged_cards_values) == true
  end

  test "it should return false if the hand is not a Two pair kind of card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 2D 5S 9C KD")
    arranged_cards_values = PokerPlay.arrange_cards(hand1)
    assert PokerPlay.TwoPair.check(arranged_cards_values) == false
  end
end
