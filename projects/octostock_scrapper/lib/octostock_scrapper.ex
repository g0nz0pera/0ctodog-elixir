defmodule OctostockScrapper do
  @base_url "https://finance.yahoo.com/quote/"

  def fetch_stock_html(stock_symbol) do
    url = "#{@base_url}#{stock_symbol}"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Failed to fetch data. Status code: #{status_code}")
        {:error, :bad_response }
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Failed to fetch data. Error: #{reason}")
        {:error, reason}
    end
  end

end
