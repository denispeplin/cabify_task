defmodule Cabify.Rule.Default do
  @behaviour Cabify.Rule

  defstruct []

  def sum(_products_count, total, price, _rule), do: total + price
end
