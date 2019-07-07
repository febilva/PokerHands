defmodule PokerPlay.Flush do
  require IEx

  @doc """
  will return true if all the cards have same suit
  """
  def check(cards) do
    cards
    |> Enum.map(& &1.suit)
    |> Enum.uniq()
    |> Kernel.length()
    |> Kernel.==(1)
  end
end
