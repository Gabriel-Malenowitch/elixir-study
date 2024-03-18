list = [109, 97, 100, 97, 103, 97, 115, 99, 97, 114, 44, 32, 105, 115, 115, 111, 32, 118, 97, 105, 32, 115, 101, 114, 32, 117, 109, 97, 32, 97, 114, 118, 111, 114, 101, 32, 98, 105, 110, 225, 114, 105, 97]

# Enum.map(list, &IO.puts(&1))

defmodule Sort do
  def sort([]), do: []
  def sort [pivot | rest] do
    {smaller, greater} = Enum.split_with(rest, &(&1 <= pivot))
    sort(smaller) ++ [pivot] ++ sort(greater)
  end
end

util = Sort.sort(list)

# Sorted
# Enum.map(util, &Integer.to_string(&1)) |> IO.puts()


treeList = [
  [
    28,
    12,
    [ 98, [199, [ [21, 53], 21, [2],[12] ], 123], [12] ],
    [ 21, [908, 89], 12, [12,980, 12,12], [ [1, 21, 421], [ [12, 12], [412, 31] ]]]
  ],
  [
    28,
    12,
    [ 21, [908, 89], [ [1, 421], [ [12, 12], [412, 31] ]]],
    [ 98, [199, [ 2,[12] ], 123], [12] ],
  ]
]

# treeList = [
#   [12, 13,14,15, [34, 56]],
#   [11, [78, 910]]
# ]


defmodule Spaces do
  def generate_spaces(spaces, acc \\ "")
  def generate_spaces(spaces, acc) do
    if spaces == length(to_charlist(acc)),
    do: acc,
    else: generate_spaces(spaces, acc <> " ")
   end
end

spaces = %{
  w_space: Spaces.generate_spaces(6) |> to_string(),
  h_space: Spaces.generate_spaces(2) |> to_string(),
}

defmodule Tree do
  def printTree(list) do
    safe_list = if(is_list(list), do: list, else: [list])

    row = Enum.reduce(safe_list, "", fn
        item, acc when is_list(item) -> "#{acc}      |"
        item, acc when is_integer(item) -> "#{acc}      #{item}"
        _item, _acc -> ""
      end
    )

    IO.puts(row)

    Enum.each(safe_list,  fn
        item when is_list(item) -> printTree(item)
        _item -> :ok
      end
    )
  end
end

Tree.printTree(treeList)
