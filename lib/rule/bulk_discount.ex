defmodule Cabify.Rule.BulkDiscount do
  @moduledoc """
  As the challenge description says, `buying x or more of a product`,
  the product amout is tunable here, so it is possible to set a number
  of products to by to get the discount.
  """
  @behaviour Cabify.Rule

  @enforce_keys [:product_code, :amount, :price]
  defstruct [:product_code, :amount, :price]

  @doc """
  Gives a discount to all items if they amount equals or exceeds amount in the rule

  ## Examples:

      iex> rule = %Cabify.Rule.BulkDiscount{product_code: "NOPE", amount: 3, price: 3}
      iex> sum(0, 10, 5, rule)
      15

      iex> rule = %Cabify.Rule.BulkDiscount{product_code: "NOPE", amount: 3, price: 3}
      iex> sum(1, 15, 5, rule)
      20

      iex> rule = %Cabify.Rule.BulkDiscount{product_code: "NOPE", amount: 3, price: 3}
      iex> sum(2, 20, 5, rule)
      19

      iex> rule = %Cabify.Rule.BulkDiscount{product_code: "NOPE", amount: 3, price: 3}
      iex> sum(3, 19, 5, rule)
      22
  """
  def sum(products_count, total, price, rule) do
    current_product_number = products_count + 1

    cond do
      current_product_number == rule.amount ->
        total - products_count * price + current_product_number * rule.price

      current_product_number > rule.amount ->
        total + rule.price

      true ->
        total + price
    end
  end
end
