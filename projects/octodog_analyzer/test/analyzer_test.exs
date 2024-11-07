defmodule AnalyzerTest do
  use ExUnit.Case
  alias Analyzer

  @sample_text "Hello world!\nThis is a sample text file."

  test "count_lines/1 returns correct line count" do
    assert Analyzer.count_lines(@sample_text) == 2
  end

  test "count_words/1 returns correct word count" do
    assert Analyzer.count_words(@sample_text) == 8
  end

  test "count_characters/1 returns correct character count" do
    assert Analyzer.count_characters(@sample_text) == String.length(@sample_text)
  end

  test "calculate_average_word_length/1 returns correct average word length" do
    words = String.split(@sample_text, ~r/\s+/)
    assert Float.round(Analyzer.calculate_average_word_length(words), 2) == 4.13
  end

  test "find_most_common_words/1 returns correct top words" do
    content = "apple banana apple orange apple banana banana"
    top_words = Analyzer.find_most_common_words(content, 2)
    assert top_words == [{"apple", 3}, {"banana", 3}]
  end

end