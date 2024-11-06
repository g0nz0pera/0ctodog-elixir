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

  def check_file(file_path) do
    cond do
      file_path == "" ->
        IO.puts("You must enter a file path to continue.")
      File.exists?(file_path) ->
        IO.puts("File found! Ready to Analyze.")
      true ->
        IO.puts("The file path you entered does not exist. Please try again.")
    end
  end
end
