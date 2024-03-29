defmodule PokerPlay do
  alias PokerPlay.Card
  alias PokerPlay.Hand.Compare

  @moduledoc """
  Documentation for PokerPlay.
  """

  @doc """
  Compare the input hands white and black
  """
  require IEx

  def compare(hand1, hand2) do
    black = hand1 |> hand_initialization()
    white = hand2 |> hand_initialization()

    black_hand_type = find_hand_type(black)
    white_hand_type = find_hand_type(white)

    result = Compare.compare(white_hand_type, black_hand_type)

    case result do
      ^white_hand_type ->
        "White wins - #{white_hand_type}"

      ^black_hand_type ->
        "Black wins - #{black_hand_type}"

      {:tie, type} ->
        black_hand_values =
          black
          |> arrange_cards()
          |> PokerPlay.HighCard.high_card_values()

        white_hand_values =
          white
          |> arrange_cards()
          |> PokerPlay.HighCard.high_card_values()

        PokerPlay.HandValue.compare(black_hand_values, white_hand_values)
        |> case do
          {:left, higher_rank_card_value} ->
            higher_card = higher_rank_card_value |> Card.char_value()
            "Black wins - high card: #{higher_card}"

          {:right, higher_rank_card_value} ->
            higher_card = higher_rank_card_value |> Card.char_value()
            "White wins - high card: #{higher_card}"

          :tie ->
            "Tie"
        end

      _ ->
        nil
    end
  end

  def hand_initialization(hand_input) do
    hand_input
    |> Card.format_input()
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
    |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)
    |> Enum.sort_by(fn x -> x.int_value end)
    |> Enum.reverse()
  end

  def find_hand_type(cards) do
    cards
    |> arrange_cards()
    |> hand_type(cards)
  end

  defp hand_type(arranged_cards, cards) do
    cond do
      PokerPlay.StraightFlush.check(cards) ->
        "StraightFlush"

      PokerPlay.FourOfKind.check(arranged_cards) ->
        "FourOfAKind"

      PokerPlay.FullHouse.check(arranged_cards) ->
        "FullHouse"

      PokerPlay.Flush.check(cards) ->
        "Flush"

      PokerPlay.Straight.check(cards) ->
        "Straight"

      PokerPlay.ThreeOfKind.check(arranged_cards) ->
        "ThreeOfAKind"

      PokerPlay.TwoPair.check(arranged_cards) ->
        "TwoPairs"

      PokerPlay.Pair.check(arranged_cards) ->
        "Pair"

      true ->
        "HighCard"
    end
  end

  def arrange_cards(cards) do
    cards
    |> Enum.group_by(& &1.int_value)
    |> Enum.sort_by(fn {int_value, _items} -> int_value end)
    |> Enum.sort_by(fn {_int_value, items} -> Kernel.length(items) end)
    |> Enum.reverse()
    |> Enum.map(fn {_int_value, items} -> Enum.map(items, & &1.value) end)
  end
end
