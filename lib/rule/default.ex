defmodule Cabify.Rule.Default do
  @behaviour Cabify.Rule

  def sum(_products_count, total, price), do: total + price
end
