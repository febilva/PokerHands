defmodule PokerPlay.Hand.CompareTest do
  use ExUnit.Case
  alias PokerPlay.Hand.Compare

  test "it should return higher rank hand" do
    assert Compare.compare("StraightFlush", "FourOfAKind") == "StraightFlush"
    assert Compare.compare("FullHouse", "Flush") == "FullHouse"
    assert Compare.compare("Straight", "ThreeOfAKind") == "Straight"
    assert Compare.compare("TwoPairs", "Pair") == "TwoPairs"
    assert Compare.compare("Pair", "HighCard") == "Pair"
  end

  test "it does return the tie tuple with name" do
    assert Compare.compare("TwoPairs", "TwoPairs") == {:tie, "TwoPairs"}
    assert Compare.compare("HighCard", "HighCard") == {:tie, "HighCard"}
    assert Compare.compare("Pair", "Pair") == {:tie, "Pair"}
  end
end
