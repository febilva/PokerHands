defmodule PokerPlay.StraightFlush do
  alias PokerPlay.{Straight, Flush}

  def check(cards) do
    Flush.check(cards) && Straight.check(cards)
  end
end
