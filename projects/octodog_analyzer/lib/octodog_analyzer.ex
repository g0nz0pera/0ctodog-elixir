defmodule OctodogAnalyzer do
  def start do
    IO.puts("Welcome to the OctoDog TextAnalizer!")
    IO.puts("Please enter the path to the text file you want to analyze: ")

    # Get the user input and remove any extra whitespace or newlines
    file_path = IO.gets(" |> ") |> String.trim()
    IO.puts("Checking the filepath: #{file_path}")
    # Pass th e file path to helper function to check if the file exists
    check_file(file_path)
  end

  defp check_file(file_path) do
    cond do
      file_path == "" ->
        IO.puts("No file path provided. Please enter a valid path.")
      File.exists?(file_path) ->
        IO.puts("File found! Ready to Analyze.")
        analyze_file(file_path)
      true ->
        IO.puts("The file was not found. Please Check and try again.")
    end
  end

  defp analyze_file(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        IO.puts("File Successfully Read!. Ready to process content!")
        # Placeholder for the next processing steps
        process_content(content)
        {:error, reason} ->
          IO.puts("Error reading the file: #{reason}")
    end
  end

  defp process_content(content) do
    # Split the content by lines and count
    lines = String.split(content, "\n", trim: true)
    line_count = length(lines)

    #Split the content by whitespaces to get words and count
    words = Enum.flat_map(lines, &String.split(&1))
    word_count = length(words)

    # Count all characters, including spaces
    char_count = String.length(content)

    # Display Result
    IO.puts("Analysis Complete:")
    IO.puts("Line Count: #{line_count}")
    IO.puts("Word count: #{word_count}")
    IO.puts("Character Count: #{char_count}")
  end
end
