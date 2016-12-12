defmodule Bob do
  def hey(input) do
    cond do
       String.trim(input) == "" -> "Fine. Be that way!"
       String.upcase(input) == input -> "Whoa, chill out!"
       String.last("?") == "?" -> "Sure."
       true -> "Whatever."
    end
  end
end
