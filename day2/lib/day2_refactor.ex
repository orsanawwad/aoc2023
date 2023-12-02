# Attempted refactor, I know nothing of this language...
defmodule Day2Refactor do

  def color_to_map(sub_game) do
    [val, key] = String.split(sub_game, " ")
    %{key => String.to_integer(val)}
  end

  def convert_game_to_map(game) do
    game
    |> Enum.map(&color_to_map/1)
    |> Enum.reduce(fn x, acc ->
        Map.merge(x, acc, fn _key, map1, map2 ->
          for {k, v1} <- map1, into: %{}, do: {k, v1 + map2[k]}
        end)
    end)
  end

  def parse_games(raw_games) do
    games = raw_games
      |> String.split("\n")

    games = games
      |> Enum.map(&Regex.replace(~r/Game \d*: /, &1, ""))
      |> Enum.map(&String.split(&1, "; "))

    for game <- games, do: game
      |> Enum.map(&String.split(&1, ", "))
      |> Enum.map(&convert_game_to_map/1)
  end

  def is_game_possible(game) do
    rgb_map = %{"red" => 12, "green" => 13, "blue" => 14}
    game = for sub_game <- game, do: sub_game
      |> Enum.map(fn {k, v} -> rgb_map[k] >= v end)
    game
      |> List.flatten()
      |> Enum.all?()
  end

  def count_by_game_id(games_result) do
    games_result
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn({val, index}, acc) -> val && acc + index || acc end)
  end

  def reduce_to_max_and_sum(games) do
    games = for game <- games, do: game
      |> Enum.reduce(fn x, acc ->
          Map.merge(x, acc, fn _key, map1, map2 ->
          max(map1, map2)
        end)
    end)

    games = for game <- games, do: game
      |> Enum.map(fn {_k, v} -> v end)
      |> Enum.reduce(fn x, acc -> x * acc end)

    games
      |> Enum.sum()

  end

  def part1(inputFileName) do
    {_, contents} = File.read(inputFileName)

    games = contents
      |> parse_games
      |> Enum.map(&is_game_possible/1)
      |> count_by_game_id

    # games = contents
    #   |> parse_games
    # games = for game <- games, do: game
    #   |> is_game_possible
    # games
    #   |> count_by_game_id
  end

  def part2(inputFileName) do
    {_, contents} = File.read(inputFileName)

    contents
      |> parse_games
      |> reduce_to_max_and_sum

  end
end
