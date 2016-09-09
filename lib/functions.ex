defmodule Functions do
  @type t :: number
  @type unary_function(t) :: (t -> t)

  @spec compose((t -> t), (t -> t)) :: (t -> t) when t: var
  # @spec compose(unary_function(t), unary_function(t)) :: unary_function(t)
  def compose(f, g) do
    fn(x) -> f.(g.(x)) end
  end

  @spec compose([unary_function(t)]) :: unary_function(t)
  def compose(functions) when is_list(functions) do
    [fun|funs] = Enum.reverse(functions)
    Enum.reduce(funs, fun, &(compose(&1, &2)))
  end

  def increment(n), do: n + 1
  def double(n), do: n * 2
  def square(n), do: n * n
  def incompatible(x, y), do: x + y

  @spec nefarious(integer) :: String.t
  def nefarious(n), do: "evil"

  def broken? do
    composed2 = Functions.compose(&increment/1, &nefarious/1)
    # composed2 = Functions.compose(&increment/1, &incompatible/2)
    composed3 = Functions.compose([&increment/1, &nefarious/1, &square/1])
    composed3.(3)
  end
end
