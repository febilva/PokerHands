defmodule PokerPlay.HighCard do
  alias PokerPlay.Card

  def high_card_values(arranged_values) do
    arranged_values
    |> Enum.concat()
    |> Enum.map(&Card.int_value(&1))
  end
end
