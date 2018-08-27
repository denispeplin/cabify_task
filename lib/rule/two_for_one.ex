defmodule Cabify.Rule.TwoForOne do
  @behaviour Cabify.Rule

  @enforce_keys [:product_code]
  defstruct [:product_code]

  @doc """
  Adds every second item for free

  ## Examples:

      iex> sum(0, 0, 1, nil)
      1

      iex> sum(1, 11, 2, nil)
      11

      iex> sum(2, 15, 3, nil)
      18

      iex> sum(3, 18, 5, nil)
      18

      iex> sum(4, 22, 7, nil)
      29
  """
  def sum(products_count, total, price, _rule) do
    case rem(products_count, 2) do
      0 -> total + price
      1 -> total
    end
  end
end
