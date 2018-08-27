defmodule Cabify do
  @products %{
    "MUG" => %Cabify.Product{code: "MUG", name: "Cafify Coffee Mug", price: 7.5},
    "VOUCHER" => %Cabify.Product{code: "VOUCHER", name: "Cabify Voucher", price: 5.0},
    "TSHIRT" => %Cabify.Product{code: "TSHIRT", name: "Cabify T-Shirt", price: 20.0}
  }
  def products, do: @products
end
