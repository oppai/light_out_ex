defmodule LightsOut do
  @init_map [
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1]
  ]
  def solver(w, h, initial_map \\ @init_map) do
    kernel_map = gen_kernel(w, h)
  end

  def gen_kernel(w, h) do
    for j <- 0..(h - 1) do
      for i <- 0..(w - 1), do: gen_input_kernel(w, h, i, j)
    end
    |> List.foldl([], fn x, acc -> acc ++ x end)
  end

  defp gen_input_kernel(w, h, m, n) do
    for i <- 0..(w * h - 1) do
      cond do
        w * n + m == i -> 1
        w * (n - 1) + m == i -> 1
        w * (n + 1) + m == i -> 1
        w * n + m + 1 == i && m + 1 < w -> 1
        w * n + m - 1 == i && m - 1 >= 0 -> 1
        true -> 0
      end
    end
  end
end
