defmodule Stack do
  @type value :: any
  @opaque t :: [value]

  @spec new() :: Stack.t
  def new do
    []
  end

  @spec push(Stack.t, value) :: Stack.t
  def push(stack, value) do
    [value|stack]
  end

  @spec pop(Stack.t) :: {value, Stack.t}
  def pop([top|rest]) do
    {top, rest}
  end
end
