defmodule Cabify.Product do
  @enforce_keys [:code, :name, :price]
  defstruct [:code, :name, :price]
end
