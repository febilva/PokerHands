defmodule PokerPlay.Pair do
  def check(arranged_card_values, cards) do
    arranged_card_values
    |> Enum.at(0)
    |> Kernel.length()
    |> Kernel.==(2)
  end
end
