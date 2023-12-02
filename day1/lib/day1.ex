defmodule Day1 do

  def part1(inputFileName) do
    {_, contents} = File.read(inputFileName)
    contents
      |> String.replace(" ", "")
      |> String.replace(~r/[^\d|\n]/, "")
      |> String.split("\n")
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.map(fn x -> Enum.join([String.at(x, 0),String.at(x, -1)]) end)
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.sum()
  end

  def part2(inputFileName) do
    {_, contents} = File.read(inputFileName)
    contents
      |> String.replace(" ", "")
      |> String.split("\n")
      |> Enum.filter(fn x -> x != "" end)
      # look...
      |> Enum.map(fn x -> String.replace(x, "one", "one1one") end)
      |> Enum.map(fn x -> String.replace(x, "two", "two2two") end)
      |> Enum.map(fn x -> String.replace(x, "three", "three3three") end)
      |> Enum.map(fn x -> String.replace(x, "four", "four4four") end)
      |> Enum.map(fn x -> String.replace(x, "five", "five5five") end)
      |> Enum.map(fn x -> String.replace(x, "six", "six6six") end)
      |> Enum.map(fn x -> String.replace(x, "seven", "seven7seven") end)
      |> Enum.map(fn x -> String.replace(x, "eight", "eight8eight") end)
      |> Enum.map(fn x -> String.replace(x, "nine", "nine9nine") end)
      # it works
      |> Enum.map(fn x -> String.replace(x, ~r/[^\d|\n]/, "") end)
      |> Enum.map(fn x -> Enum.join([String.at(x, 0),String.at(x, -1)]) end)
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.sum()
  end
end
