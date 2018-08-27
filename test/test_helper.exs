ExUnit.start()

defmodule Cabify.TestSetup do
  def setup_products_and_rules(_opts) do
    %{
      mug: %Cabify.Product{code: "MUG", name: "Cafify Coffee Mug", price: 7.5},
      voucher: %Cabify.Product{code: "VOUCHER", name: "Cabify Voucher", price: 5.0},
      tshirt: %Cabify.Product{code: "TSHIRT", name: "Cabify T-Shirt", price: 20.0},
      two_for_one: %Cabify.Rule.TwoForOne{product_code: "VOUCHER"},
      bulk_discount: %Cabify.Rule.BulkDiscount{product_code: "TSHIRT", amount: 3, price: 19.0}
    }
  end
end
