# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

defmodule PrimeFactor do

  def factor(n, divisor, factors) do
    # IO.puts("n=#{n}, divisor=#{divisor}")
    cond do
      # Even
      rem(n,2) == 0 ->
        f = [2] ++ factors
        factor(div(n,divisor), 2, f)
      # Odd
      rem(n,2) != 0 and divisor <= :math.sqrt(n)  ->
        if(rem(n,divisor) == 0) do
          f = [divisor] ++ factors
          factor(div(n,divisor), divisor, f)
        else
          factor(n, divisor+2, factors)
        end
      n > 2 ->
        f = [n] ++ factors
        f
      true ->
        factors
    end

  end

  def factor(n) do
    if (rem(n,2) == 0) do
      factor(n, 2, [])
    else
      factor(n, 3, [])
    end
  end
end

n = PrimeFactor.factor(600851475143)

l = Enum.max(n)

IO.puts(l)

#Enum.each(n, fn(i) -> IO.puts(i) end)
