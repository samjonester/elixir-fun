defmodule OrderTest do
  use ExUnit.Case
  doctest Order

  test ".item_count default" do
    assert %Order{}
      |> Order.item_count
      == 0
  end

  test ".add_item/4 with item_count" do
    assert %Order{}
      |> Order.add_item("burger", 10, 2)
      |> Order.item_count
      == 2
  end

  test ".add_item/3 with item_count" do
    assert %Order{}
      |> Order.add_item("burger", 10)
      |> Order.item_count
      == 1
  end

  test ".sum_prices" do
    assert %Order{}
      |> Order.add_item("burger 1", 10)
      |> Order.add_item("burger 2", 8)
      |> Order.add_item("fries", 3, 2)
      |> Order.sum_prices
      == 24
  end
end
