defmodule PokerPlay do
  alias PokerPlay.Card

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
    find_hand_type(black)
    find_hand_type(white)
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
        "Straight Flush Hand"

      PokerPlay.FourOfKind.check(arranged_cards) ->
        "Four Of Kind Card Hand"

      PokerPlay.FullHouse.check(arranged_cards) ->
        "Full House Kind of Card Hand"

      PokerPlay.Flush.check(cards) ->
        "Flush Card Hand"

      PokerPlay.Straight.check(cards) ->
        "Straight Card Hand"

      PokerPlay.ThreeOfKind.check(arranged_cards) ->
        "Three Of Kind Card Hand"

      PokerPlay.TwoPair.check(arranged_cards) ->
        "Two Pair Card Hand"

      PokerPlay.Pair.check(arranged_cards) ->
        "Pair Card Hand"

      true ->
        "High Card Hand"
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
