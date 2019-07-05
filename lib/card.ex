defmodule PokerPlay.Card do
  defstruct int_value: 0, suit: "", value: ""

  @map_card_value %{
    "T" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
  }

  @doc """
    initlizing the given string to Card Struct 
  """
  def init(card_value, suit) do
    %__MODULE__{
      value: card_value,
      suit: suit,
      int_value: int_value(card_value)
    }
  end

  @doc """
  format given input for further use
  """
  def format_input(hand) do
    hand
    |> String.trim("Black:")
    |> String.trim("White:")
    |> String.split(" ", trim: true)
  end

  def int_value(value) when value in ["T", "J", "Q", "K", "A"] do
    @map_card_value[value]
  end

  def int_value(value) do
    value |> String.to_integer()
  end
end
