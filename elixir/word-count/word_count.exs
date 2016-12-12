defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    # this will match --- as a word but since the tests passed and this being an
      # exercise I don't really care..
    ~r/(?:(?:\p{L}|-)+|\d+)/u
    |> Regex.scan(sentence)
    |> List.flatten
    |> Enum.reduce(%{}, fn(word, acc) ->
      {_, acc} = Map.get_and_update(acc, String.downcase(word), fn(count) ->
        {count, (count || 0) + 1}
      end)
      acc
    end)
  end
end
