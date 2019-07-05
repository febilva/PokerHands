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
    white =
      hand1
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    black =
      hand2
      |> Card.format_input()
      |> Enum.map(fn x -> String.split(x, "", trim: true) end)
      |> Enum.map(fn x -> Card.init(Enum.at(x, 0), Enum.at(x, 1)) end)

    # white
    find_hand_type(white)
    # find_hand_type(black)
  end

  def find_hand_type(cards) do
    cards
    |> arrange_cards()
    |> hand_type(cards)
  end

  defp hand_type(arranged_cards, hand) do
    cond do
      PokerPlay.Pair.check(arranged_cards, hand) ->
        "Pair Hand"

      true ->
        "High Hand"
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
