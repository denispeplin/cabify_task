defmodule Cabify.Rule do
  @callback sum(:float, :float, :float, :any) :: :float

  def get(rules, product) do
    Enum.find(rules, fn rule ->
      rule.product_code == product.code
    end) || %Cabify.Rule.Default{}
  end
end
