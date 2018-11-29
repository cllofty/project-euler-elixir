# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

defmodule Multiples do

  def sum(0, accumlator) do
    accumlator
  end

  def sum(n, accumlator) do
    case {rem(n, 3), rem(n, 5)} do
      {0,_} -> sum(n-1, accumlator + n)
      {_,0} -> sum(n-1, accumlator + n)
      {_,_} -> sum(n-1, accumlator)
    end
  end

  def sum(n) do
    sum(n, 0)
  end
end

x = Multiples.sum(999)

IO.puts(x)
