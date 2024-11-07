defmodule OctodogAnalyzer do
  alias FileHandler
  alias Analyzer

  def start do
    IO.puts("Welcome to the OctoDog TextAnalizer!")
    IO.puts("Please enter the path to the text file you want to analyze: ")

    # Get the user input and remove any extra whitespace or newlines
    file_path = IO.gets(" |> ") |> String.trim()

    IO.puts("Checking the filepath: #{file_path}")
    # Pass th e file path to helper function to check if the file exists
    case FileHandler.check_file(file_path) do
      {:ok, path} ->
        case FileHandler.analyze_file(path) do
          {:ok, content} -> process_content(content)
          {:error, reason} -> IO.puts("Error reading the file: #{reason}")
        end
      {:error, _reason} ->
        IO.puts("Please try again with a valid file path")
    end
  end



  defp process_content(content) do

    lines_count = Analyzer.count_lines(content)
    words = String.split(content, ~r/\s+/)
    word_count = length(words)
    char_count = Analyzer.count_characters(content)
    average_word_length = Analyzer.calculate_average_word_length(words)
    top_words = Analyzer.find_most_common_words(content)


    # Display Result
    IO.puts("Analysis Complete:")
    IO.puts("Line Count: #{lines_count}")
    IO.puts("Word count: #{word_count}")
    IO.puts("Character Count: #{char_count}")
    IO.puts("Average word length: #{Float.round(average_word_length, 2)}")

    IO.puts("Most Common words:")
    Enum.each(top_words, fn {word, count} ->
      IO.puts("#{word}: #{count} times")
    end)
  end



end

