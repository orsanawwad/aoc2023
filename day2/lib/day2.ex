# what the hell is this
defmodule Day2 do

  def check_sub_game_fn(sub_game) do
    rgb_map = %{"red" => 12, "green" => 13, "blue" => 14}
    [val, key] = String.split(sub_game, " ")
    Map.get(rgb_map,key) >= String.to_integer(val)
  end

  def check_game_fn(game) do
    game
    |> Enum.map(&check_sub_game_fn/1)
    |> Enum.all?()
  end

  def part1(inputFileName) do

    {_, contents} = File.read(inputFileName)
    games = contents
      |> String.split("\n")

    games = games
      |> Enum.map(&Regex.replace(~r/Game \d*: /, &1, ""))
      |> Enum.map(&String.split(&1, "; "))

    games = for game <- games, do: game
      |> Enum.map(&String.split(&1, ", "))
      |> Enum.map(&check_game_fn/1)
      |> Enum.all?()

    games
      |> Enum.with_index(1)
      |> Enum.reduce(0, fn({val, index}, acc) -> val && acc + index || acc end)
  end

  def check_sub_game_fn_part2(sub_game) do
    [val, key] = String.split(sub_game, " ")
    %{key => String.to_integer(val)}
  end

  def check_game_fn_part2(game) do
    game
    |> Enum.map(&check_sub_game_fn_part2/1)
    |> Enum.reduce(fn x, acc ->
        Map.merge(x, acc, fn _key, map1, map2 ->
          for {k, v1} <- map1, into: %{}, do: {k, v1 + map2[k]}
        end)
    end)
  end

  def reduce_to_max(game) do
    game
    |> Enum.reduce(fn x, acc ->
        Map.merge(x, acc, fn _key, map1, map2 ->
          max(map1, map2)
        end)
    end)
  end

  def part2(inputFileName) do

    {_, contents} = File.read(inputFileName)
    games = contents
      |> String.split("\n")

    games = games
      |> Enum.map(&Regex.replace(~r/Game \d*: /, &1, ""))
      |> Enum.map(&String.split(&1, "; "))

    games = for game <- games, do: game
      |> Enum.map(&String.split(&1, ", "))
      |> Enum.map(&check_game_fn_part2/1)

    games = games
      |> Enum.map(&reduce_to_max/1)

    games = for game <- games, do: game
      |> Enum.map(fn {_k, v} -> v end)
      |> Enum.reduce(fn x, acc -> x * acc end)

    games
      |> Enum.sum()
  end
end
