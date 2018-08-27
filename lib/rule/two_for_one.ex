defmodule Cabify.Rule.TwoForOne do
  @behaviour Cabify.Rule

  @enforce_keys [:product_code]
  defstruct [:product_code]

  @doc """
  Adds every second item for free

  ## Examples:

      iex> sum(1, 11, 2)
      11
      iex> sum(2, 15, 3)
      18
      iex> sum(3, 18, 5)
      18
      iex> sum(4, 22, 7)
      29
  """
  def sum(products_count, total, price) do
    case rem(products_count, 2) do
      0 -> total + price
      1 -> total
    end
  end
end
