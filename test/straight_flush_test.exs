defmodule PokerPlay.StraightFlushTest do
  use ExUnit.Case
  alias PokerPlay.{Card}
  alias PokerPlay

  test "check the hand is Straight flush kind of card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 3H 4H 5H 6H")
    hand2 = PokerPlay.hand_initialization("Black: AH 2H 3H 4H 5H")
    hand3 = PokerPlay.hand_initialization("Black: AH KH QH JH TH")
    assert PokerPlay.StraightFlush.check(hand1) == true
    assert PokerPlay.StraightFlush.check(hand2) == true
    assert PokerPlay.StraightFlush.check(hand3) == true
  end

  test "check the hand is not a Straight flush kind of card" do
    hand1 = PokerPlay.hand_initialization("Black: 2H 3H 4H 5D 6D")
    hand2 = PokerPlay.hand_initialization("Black: AH 2H 3H 4H 5D")
    hand3 = PokerPlay.hand_initialization("Black: AH KH QH JH TD")
    assert PokerPlay.StraightFlush.check(hand1) == false
    assert PokerPlay.StraightFlush.check(hand2) == false
    assert PokerPlay.StraightFlush.check(hand3) == false
  end
end
