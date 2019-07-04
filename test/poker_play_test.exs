defmodule PokerPlayTest do
  use ExUnit.Case
  doctest PokerPlay
  alias PokerPlay.Card

  # test "greets the world" do
  #   assert PokerPlay.hello() == :world
  # end

  # test "take input and  "

  test "format the given input" do
    assert Card.format_input("Black: 2H 3D 5S 9C KD") == ["2H", "3D", "5S", "9C", "KD"]
  end

  test "initialize input hand to Card struct" do
    assert PokerPlay.Card.init("2", "H") == %PokerPlay.Card{value: "2", suit: "H", int_value: 2}
    assert PokerPlay.Card.init("T", "S") == %PokerPlay.Card{value: "T", suit: "S", int_value: 10}
    assert PokerPlay.Card.init("K", "D") == %PokerPlay.Card{value: "K", suit: "D", int_value: 13}
  end
end
