defmodule RunLengthEncoder do
  @spec encode(String.t) :: String.t
  def encode(string) do
    chars = String.graphemes(string)
    do_encode(chars, Enum.at(chars, 0), 0, "")
  end

  defp do_encode([], nil, 0, ""), do: ""

  defp do_encode([], last, count, str) do
    str <> Integer.to_string(count) <> last
  end

  defp do_encode([current|t], last, count, str) when current == last do
    do_encode(t, current, count + 1, str)
  end

  defp do_encode([current|t], last, count, str) when current != last do
    str = str <> Integer.to_string(count) <> last
    do_encode(t, current, 1,  str)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(?:(\d+)(\w))/, string, capture: :all_but_first)
    |> Enum.map(&decode_pair/1)
    |> Enum.join("")
  end

  defp decode_pair([count, letter]) do
    String.duplicate(letter, String.to_integer(count))
  end
end
