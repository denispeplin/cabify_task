# Cabify

Cabify code challenge implemented in Elixir. Task description is [here](TASK_DESCRIPTION.md).

## Usage

Most examples can be found in tests. `Cabify.CheckoutTest.scan` contains all
data samples from the task description and more. Here is how to run examples
in the Elixir console (`iex -S mix`):

```elixir
iex> two_for_one = %Cabify.Rule.TwoForOne{product_code: "VOUCHER"}
iex> bulk_discount = %Cabify.Rule.BulkDiscount{product_code: "TSHIRT", amount: 3, price: 19}
iex> checkout = Cabify.Checkout.new([two_for_one, bulk_discount])
iex> checkout = Cabify.Checkout.scan("MUG", checkout)
iex> checkout.total
7.5
iex> checkout = Cabify.Checkout.scan("VOUCHER", checkout)
iex> checkout.total
12.5
iex> checkout = Cabify.Checkout.scan("VOUCHER", checkout)
iex> checkout.total
12.5
iex> checkout = Cabify.Checkout.scan("VOUCHER", checkout)
iex> checkout.total
17.5
```

and so on...

## Docs

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/cabify](https://hexdocs.pm/cabify).
