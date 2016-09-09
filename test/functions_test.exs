defmodule FunctionsTest do
  use ExUnit.Case
  doctest Functions

  def increment(n), do: n + 1
  def double(n), do: n * 2
  def square(n), do: n * n

  test "compose two functions" do
    composed = Functions.compose(&increment/1, &double/1)
    assert composed.(3) == 7
  end

  test "compose list of one function" do
    composed = Functions.compose([&increment/1])
    assert composed.(3) == 4
  end

  test "compose list of two functions" do
    composed = Functions.compose([&increment/1, &double/1])
    assert composed.(3) == 7
  end

  test "compose list of three functions" do
    composed = Functions.compose([&increment/1, &double/1, &square/1])
    assert composed.(3) == increment(double(square(3)))
  end

  def nefarious(n), do: Integer.to_string(n)

  test "compose with nefarious function" do
    composed = Functions.compose([&increment/1, &nefarious/1, &square/1])
    # composed.(3)
  end
end
