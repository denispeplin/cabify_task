defmodule Cabify.CheckoutTest do
  use ExUnit.Case, async: true
  import Cabify.TestSetup

  setup :setup_products_and_rules

  describe "scan" do
    test "regular products (no specific rules)", opts do
      checkout = Cabify.Checkout.new()
      mug = opts.mug
      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               rules: [],
               products: [
                 mug
               ],
               total: 7.5
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               rules: [],
               products: [
                 mug,
                 mug
               ],
               total: 15
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               rules: [],
               products: [
                 mug,
                 mug,
                 mug
               ],
               total: 22.5
             }
    end

    test "regular and two_for_one rule", opts do
      {mug, voucher, two_for_one} = {opts.mug, opts.voucher, opts.two_for_one}
      checkout = Cabify.Checkout.new([two_for_one])

      checkout = Cabify.Checkout.scan(voucher, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 voucher
               ],
               rules: [two_for_one],
               total: 5.0
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 voucher
               ],
               rules: [two_for_one],
               total: 12.5
             }

      checkout = Cabify.Checkout.scan(voucher, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 voucher,
                 mug,
                 voucher
               ],
               rules: [two_for_one],
               total: 12.5
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 voucher,
                 mug,
                 voucher
               ],
               rules: [two_for_one],
               total: 20
             }
    end

    test "regular, two_for_one and bulk_discount rules", opts do
      {mug, voucher, tshirt, two_for_one, bulk_discount} =
        {opts.mug, opts.voucher, opts.tshirt, opts.two_for_one, opts.bulk_discount}

      checkout = Cabify.Checkout.new([two_for_one, bulk_discount])

      checkout = Cabify.Checkout.scan(tshirt, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 20.0
             }

      checkout = Cabify.Checkout.scan(voucher, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 25.0
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 32.5
             }

      checkout = Cabify.Checkout.scan(tshirt, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 tshirt,
                 mug,
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 52.5
             }

      checkout = Cabify.Checkout.scan(voucher, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 voucher,
                 tshirt,
                 mug,
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 52.5
             }

      checkout = Cabify.Checkout.scan(mug, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 mug,
                 voucher,
                 tshirt,
                 mug,
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 60
             }

      checkout = Cabify.Checkout.scan(tshirt, checkout)

      assert checkout == %Cabify.Checkout{
               products: [
                 tshirt,
                 mug,
                 voucher,
                 tshirt,
                 mug,
                 voucher,
                 tshirt
               ],
               rules: [
                 two_for_one,
                 bulk_discount
               ],
               total: 77
             }
    end
  end
end
