defmodule Cabify.Checkout do
  @enforce_keys [:rules, :products, :total]
  defstruct [:rules, :products, :total]

  @doc """
  Produces a new Checkout structure with default values
  """
  def new() do
    %Cabify.Checkout{rules: [], products: [], total: 0}
  end

  @doc """
  Scans products, places them into list, and calculates total
  """
  def scan(product, checkout) do
    rule = get_rule(checkout.rules, product)

    %{
      checkout
      | total: rule.sum(checkout.total, product.price),
        products: [product | checkout.products]
    }
  end

  defp get_rule(rules, product) do
    Enum.find(rules, fn rule ->
      rule.product_code == product.code
    end) || Cabify.Rule.Default
  end
end
