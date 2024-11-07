defmodule FileHandlerTest do
  use ExUnit.Case
  alias FileHandler

  describe "check_file/1" do
    test "returns :ok for a valid file path" do
      File.write!("test_file.txt", "Hello, World!")
      assert FileHandler.check_file("test_file.txt") == {:ok, "test_file.txt"}
      File.rm("test_file.txt")
    end

    test "returns :error for an invalid file path" do
      assert FileHandler.check_file("invalid_file.txt") == {:error, :file_not_found}
    end

    test "returns :error for an empty file path" do
      assert FileHandler.check_file("") == {:error, :no_file_path}
    end
  end

  describe "analyze_file/1" do
    test "returns content for a readable file" do
      File.write!("test_file.txt", "Hello, World!")
      assert FileHandler.analyze_file("test_file.txt") == {:ok, "Hello, World!"}
      File.rm("test_file.txt")
    end

    test "returns :error for unreadable file" do
      assert FileHandler.analyze_file("unreadable_file.txt") == {:error, :enoent}
    end
  end

end