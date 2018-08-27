defmodule Cabify.CheckoutTest do
  use ExUnit.Case

  describe "scan" do
    test "regular products (no specific rules)" do
      checkout = Cabify.Checkout.new()
      mug = %Cabify.Product{code: "MUG", name: "Cafify Coffee Mug", price: 7.5}
      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug
               ],
               total: 7.5
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 mug
               ],
               total: 15
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 mug,
                 mug
               ],
               total: 22.5
             }
    end
  end
end
