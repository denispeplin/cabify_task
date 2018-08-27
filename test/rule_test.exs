defmodule Cabify.RuleTest do
  use ExUnit.Case, async: true
  import Cabify.TestSetup

  setup :setup_products_and_rules

  describe "get" do
    test "empty rules", opts do
      assert Cabify.Rule.get([], opts.mug) == %Cabify.Rule.Default{}
      assert Cabify.Rule.get([], opts.voucher) == %Cabify.Rule.Default{}
    end

    test "two_for_one rule added", opts do
      rules = [opts.two_for_one]
      assert Cabify.Rule.get(rules, opts.mug) == %Cabify.Rule.Default{}
      assert Cabify.Rule.get(rules, opts.voucher) == opts.two_for_one
    end

    test "two_for_one and bulk_discount rules added", opts do
      rules = [opts.two_for_one, opts.bulk_discount]
      assert Cabify.Rule.get(rules, opts.mug) == %Cabify.Rule.Default{}
      assert Cabify.Rule.get(rules, opts.voucher) == opts.two_for_one
      assert Cabify.Rule.get(rules, opts.tshirt) == opts.bulk_discount
    end
  end
end
