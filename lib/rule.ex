defmodule Cabify.Rule do
  @callback sum(:float, :float, :float, :any) :: :float

  def get(rules, product) do
    rule =
      Enum.find(rules, fn rule ->
        rule.product_code == product.code
      end)

    if rule do
      rule
    else
      %Cabify.Rule.Default{}
    end
  end
end
