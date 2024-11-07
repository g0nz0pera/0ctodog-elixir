defmodule Analyzer do
  def count_lines(content) do
    # Split the content by lines and count
    String.split(content, "\n", trim: true) |> length()
  end

  def count_words(content) do
    content
    |> String.split(~r/\s+/)
    |> length()
  end

  def count_characters(content) do
    String.length(content)
  end

  def calculate_average_word_length(words) do
    total_length = Enum.reduce(words, 0, fn word, acc -> acc + String.length(word) end)

    if length(words) > 0 do
      total_length / length(words)
    else
      0
    end
  end

  def find_most_common_words(content, n \\ 5) do
    content
    |> String.split(~r/\s+/)
    |> Enum.frequencies()
    |> Enum.sort_by(fn {_word, count} -> -count  end)
    |> Enum.take(n)
  end
end