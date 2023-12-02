defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "test AOC 2023 Day 1" do
    assert Day1.part1("testpart1.txt") == 142
    assert Day1.part1("input.txt") == 56108
    assert Day1.part2("testpart2.txt") == 281
    assert Day1.part2("input.txt") == 55652
  end
end
