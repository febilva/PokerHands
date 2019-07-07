defmodule PokerPlayTest do
  use ExUnit.Case
  doctest PokerPlay
  alias PokerPlay.Card
  alias PokerPlay

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
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["K"], ["9"], ["5"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison pair" do
    cards =
      "Black: 2H 2D 5S 9C KD"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["2", "2"], ["K"], ["9"], ["5"]]
  end

  test "Arrange cards of a hand for comparison two pair" do
    cards =
      "Black: 2H 2D 5S 5C KD"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["5", "5"], ["2", "2"], ["K"]]
  end

  test "Arrange cards of a hand for comparison three of kind" do
    cards =
      "Black: 2H 2D 2S 9C KD"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2"], ["K"], ["9"]]
  end

  test "Arrange cards of a hand for comparison four of kind " do
    cards =
      "Black: 2H 2D 2S 2C KD"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2", "2"], ["K"]]
  end

  test "Arrange cards of a hand for comparison of Straight " do
    cards =
      "Black: 2H 3D 4S 6C 5D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["6"], ["5"], ["4"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison of Flush and StraightFlush " do
    cards =
      "Black: 2H 3H 4H 6H 5H"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["6"], ["5"], ["4"], ["3"], ["2"]]
  end

  test "Arrange cards of a hand for comparison of FullHouse " do
    cards =
      "Black: 2H 3D 2S 2C 3D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.arrange_cards(cards) == [["2", "2", "2"], ["3", "3"]]
  end

  test "this should return the type of a hand is High Card Hand" do
    cards =
      "Black: 2H 3D 8S 5C 6D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "HighCard"
  end

  test "this should return the type of a hand is Pair Card Hand" do
    cards =
      "Black: 2H 3D 2S 5C 6D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "Pair"
  end

  test "this should return the type of a hand is Two Pair Card Hand" do
    cards =
      "Black: 2H 3D 2S 5C 5D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "TwoPairs"
  end

  test "this should return the type of a hand is Three Pair Card Hand" do
    cards =
      "Black: 2H 3D 2S 5C 2D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "ThreeOfAKind"
  end

  test "this should return the type of a hand is Straight Card Hand" do
    cards =
      "Black: 2H 3D 4S 5C 6D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "Straight"
  end

  test "this should return the type of a hand is Flush Card Hand" do
    cards =
      "Black: 2H 3H 2H 5H 6H"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "Flush"
  end

  test "this should return the type of a hand is Full House kind" do
    cards =
      "Black: 2H 3D 2S 2C 3S"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "FullHouse"
  end

  test "this should return the type of a hand is Four of Hind Card" do
    cards =
      "Black: 2H 3D 2S 2C 2D"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "FourOfAKind"
  end

  test "this should return the type of a hand is Straight Flush Hand Card " do
    cards =
      "Black: 2H 3H 4H 5H 6H"
      |> PokerPlay.hand_initialization()

    assert PokerPlay.find_hand_type(cards) == "StraightFlush"
  end

  test "Find the higer rank hand from the input" do
    assert PokerPlay.compare("Black: 2H 3D 5S 9C KD", "White: 2C 3H 4S 8C AH") ==
             "White wins - high card: Ace"

    assert PokerPlay.compare("Black: 2H 4S 4C 3D 4H", "White: 2S 8S AS QS 3S") ==
             "White wins - Flush"

    assert PokerPlay.compare("Black: 2H 3D 5S 9C KD", "White: 2C 3H 4S 8C KH") ==
             "Black wins - high card: 9"

    assert PokerPlay.compare("Black: 2H 3D 5S 9C KD", "White:  2D 3H 5C 9S KH") == "Tie"

    assert PokerPlay.compare("Black: 2H 4S 2S AH 6D", "White: 2H 3H 4H 5H 6H") ==
             "White wins - StraightFlush"

    assert PokerPlay.compare("Black: 2H 4S 2S AH 6D", "White: 2H 3D 5S 9C KD") ==
             "Black wins - Pair"

    assert PokerPlay.compare("Black: 2H 4S 2S AH 2D", "White: 2H 3D 5S 9C KD") ==
             "Black wins - ThreeOfAKind"

    assert PokerPlay.compare("Black: 2H 4S 2S 2H 2D", "White: 2H 3D 5S 9C KD") ==
             "Black wins - FourOfAKind"

    assert PokerPlay.compare("Black: 2H 4S 2S 2H 4D", "White: 2H 3D 5S 9C KD") ==
             "Black wins - FullHouse"

    assert PokerPlay.compare("Black: 2H 4S 2H 4H 9H", "White: 2H 3D 5S 9C KD") ==
             "Black wins - TwoPairs"

    # assert PokerPlay.compare("Black: 2H 3H 4H 5H 6H", "White: 2H 3H 4H 5H 6H") == "Tie"
    # assert PokerPlay.compare("Black: 2H 3H 4H 5H 6H", "White: 2H 3H 4H 5H 6H") == "Tie"
  end

  # test
end
