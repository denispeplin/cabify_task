defmodule Cabify.Checkout do
  @enforce_keys [:products, :total]
  defstruct [:products, :total]

  @doc """
  Produces a new Checkout structure with default values
  """
  def new() do
    %Cabify.Checkout{products: [], total: 0}
  end

  @doc """
  Scans products, places them into list, and calculates total
  """
  def scan(product, checkout) do
    %{
      checkout
      | total: checkout.total + product.price,
        products: [product | checkout.products]
    }
  end
end
