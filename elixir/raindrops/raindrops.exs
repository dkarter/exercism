defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(n) do
    res = "#{pling?(n)}#{plang?(n)}#{plong?(n)}"
    if res == "", do: Integer.to_string(n), else: res
  end


  defp factor?(num, factor), do: rem(num, factor) == 0

  defp pling?(n), do: if factor?(n, 3), do: "Pling"
  defp plang?(n), do: if factor?(n, 5), do: "Plang"
  defp plong?(n), do: if factor?(n, 7), do: "Plong"
end
