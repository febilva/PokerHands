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
    assert Card.format_input("White: 2H 3D 5S 9C KD") == ["2H", "3D", "5S", "9C", "KD"]
  end

  test "initialize input hand to Card struct" do
    assert PokerPlay.Card.init("2", "H") == %PokerPlay.Card{value: "2", suit: "H", int_value: 2}
    assert PokerPlay.Card.init("T", "S") == %PokerPlay.Card{value: "T", suit: "S", int_value: 10}
    assert PokerPlay.Card.init("K", "D") == %PokerPlay.Card{value: "K", suit: "D", int_value: 13}
  end

  test "Arrange cards of a hand for High Card" do
    cards =
      "Black: 2H 3D 5S 9C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["K"], ["9"], ["5"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison pair" do
    cards =
      "Black: 2H 2D 5S 9C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["2", "2"], ["K"], ["9"], ["5"]]
  end

  test "Arrange cards of a hand for comparison two pair" do
    cards =
      "Black: 2H 2D 5S 5C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["5", "5"], ["2", "2"], ["K"]]
  end

  test "Arrange cards of a hand for comparison three of kind" do
    cards =
      "Black: 2H 2D 2S 9C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2"], ["K"], ["9"]]
  end

  test "Arrange cards of a hand for comparison four of kind " do
    cards =
      "Black: 2H 2D 2S 2C KD"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2", "2"], ["K"]]
  end

  test "Arrange cards of a hand for comparison of Straight " do
    cards =
      "Black: 2H 3D 4S 6C 5D"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["6"], ["5"], ["4"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison of Flush and StraightFlush " do
    cards =
      "Black: 2H 3H 4H 6H 5H"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["6"], ["5"], ["4"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison of FullHouse " do
    cards =
      "Black: 2H 3D 2S 2C 3D"
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2"], ["3", "3"]]
  end

  # test
end
