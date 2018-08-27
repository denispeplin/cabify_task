defmodule Cabify.Checkout do
  @moduledoc """
  Checkouts products with or without specific rules (selected by product code).

  In real life could also hold a `discount` among with :total, and should be based
  on decimal calculations instead of Float.
  """

  @enforce_keys [:rules, :products, :total]
  defstruct [:rules, :products, :total]

  @doc """
  Produces a new Checkout structure with default values
  """
  def new(rules \\ []) do
    %Cabify.Checkout{rules: rules, products: [], total: 0}
  end

  @doc """
  Scans products, places them into list, and calculates total
  """
  def scan(product, checkout) do
    rule = Cabify.Rule.get(checkout.rules, product)
    same_products_count = same_products_count(checkout.products, product)

    %{
      checkout
      | total: rule.sum(same_products_count, checkout.total, product.price),
        products: [product | checkout.products]
    }
  end

  defp same_products_count(stored_products, new_product) do
    Enum.count(stored_products, fn stored_product ->
      stored_product.code == new_product.code
    end)
  end
end
