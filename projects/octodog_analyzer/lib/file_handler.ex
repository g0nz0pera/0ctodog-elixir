defmodule FileHandler do

  def check_file(file_path) do
    cond do
      file_path == "" ->
        IO.puts("No file path provided. Please enter a valid path.")
        {:error, :no_file_path}
      File.exists?(file_path) ->
        IO.puts("File found! Ready to Analyze.")
        {:ok, file_path}
      true ->
        {:error, :file_not_found}
    end
  end

  def analyze_file(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        IO.puts("File Successfully Read!. Ready to process content!")
        # Placeholder for the next processing steps
        {:ok, content}
      {:error, reason} ->
        IO.puts("Error reading the file: #{reason}")
        {:error, reason}
    end
  end
end