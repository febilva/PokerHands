defmodule PokerPlay.Flush do
  require IEx

  def check(cards) do
    cards
    |> Enum.map(& &1.suit)
    |> Enum.uniq()
    |> Kernel.length()
    |> Kernel.==(1)
  end
end
