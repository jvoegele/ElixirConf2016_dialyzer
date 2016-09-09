defmodule StackUser do
  def use_a_stack do
    stack =
      Stack.new
      |> Stack.push(1)
      |> Stack.push(2)
      |> Stack.push(3)

    {3, stack} = Stack.pop(stack)

    # Since the stack is an opaque type,
    # dialyzer will complain about this:
    [top|rest] = stack
  end
end

