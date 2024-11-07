defmodule OctostockScrapperTest do
  use ExUnit.Case
  doctest OctostockScrapper

  test "greets the world" do
    assert OctostockScrapper.hello() == :world
  end
end
