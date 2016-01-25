defmodule Order do
  defstruct items: []

  def item_count(order) do
    order.items
      |> Enum.map(fn {item_and_price, count} -> count end)
      |> Enum.sum
  end

  def add_item(order, food, price, count \\ 1) do
    new_items = [ order.items | [ {{food, price}, count} ] ]
      |> List.flatten

    %{ order | items: new_items }
  end

  def sum_prices(order) do
    order.items
      |> Enum.map(fn {{item, price}, count} -> price * count end)
      |> Enum.sum
  end
end
